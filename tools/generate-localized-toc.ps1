[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$BerkPagesRoot = (Resolve-Path (Join-Path $PSScriptRoot ".."))
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-FileTextUtf8([string]$path) {
    return Get-Content -LiteralPath $path -Raw -Encoding UTF8
}

function Get-ShortTitleFromHtmlFile([string]$path) {
    if (-not (Test-Path -LiteralPath $path)) {
        return $null
    }

    $html = Get-FileTextUtf8 $path
    $m = [regex]::Match($html, '<title>\s*(.*?)\s*</title>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $m.Success) {
        return $null
    }

    $title = $m.Groups[1].Value
    # Strip common suffix: " - BERK ..."
    $title = [regex]::Replace($title, '\s+-\s+.*$', '')
    # Decode entities from <title>
    $title = [System.Net.WebUtility]::HtmlDecode($title)
    $title = $title.Trim()
    if ([string]::IsNullOrWhiteSpace($title)) {
        return $null
    }

    return $title
}

function HtmlEncode([string]$text) {
    return [System.Net.WebUtility]::HtmlEncode($text)
}

function Extract-ChapterOl([string]$tocHtml) {
    $start = $tocHtml.IndexOf('<ol class="chapter">')
    if ($start -lt 0) {
        throw 'Could not find <ol class="chapter"> in toc.html'
    }

    $end = $tocHtml.LastIndexOf('</ol>')
    if ($end -lt 0 -or $end -le $start) {
        throw 'Could not find closing </ol> for chapter list in toc.html'
    }

    return $tocHtml.Substring($start, ($end - $start) + 5)
}

function Build-LocalizedOlHtml(
    [Parameter(Mandatory = $true)][string]$langDir,
    [Parameter(Mandatory = $true)][string]$langPrefix,
    [Parameter(Mandatory = $true)][hashtable]$partTitleMap
) {
    $tocPath = Join-Path $langDir 'toc.html'
    $tocHtml = Get-FileTextUtf8 $tocPath

    $ol = Extract-ChapterOl $tocHtml

    # Remove iframe-targeting; when injected into main page this isn't desired.
    $ol = $ol -replace '\s+target="_parent"', ''

    # Translate part titles
    foreach ($key in $partTitleMap.Keys) {
        $escaped = [regex]::Escape($key)
        $replacement = $partTitleMap[$key]
        $pattern = "<li class=`"part-title`">$escaped</li>"
        $replacementHtml = "<li class=`"part-title`">$replacement</li>"
        $ol = [regex]::Replace(
            $ol,
            $pattern,
            $replacementHtml,
            [System.Text.RegularExpressions.RegexOptions]::Singleline
        )
    }

    # Rewrite chapter link hrefs and link texts from the translated pages' <title>.
    $anchorPattern = '<a\s+([^>]*?)href="([^"]+)"([^>]*)>(.*?)</a>'
    $options = [System.Text.RegularExpressions.RegexOptions]::Singleline

    $ol = [regex]::Replace($ol, $anchorPattern, {
        param($m)

        $before = $m.Groups[1].Value
        $href = $m.Groups[2].Value
        $after = $m.Groups[3].Value
        $inner = $m.Groups[4].Value

        # Skip non-local or fragment links
        if ($href.StartsWith('#') -or $href -match '^(?:[a-z+]+:)?//') {
            return $m.Value
        }

        # Remove language prefix in any path segment: basics/ko_syntax.html -> basics/syntax.html
        $prefixPattern = "(^|/)$([regex]::Escape($langPrefix))"
        $fixedHref = [regex]::Replace($href, $prefixPattern, '$1', $options)

        # Find target file and pull its title
        $targetPath = Join-Path $langDir ($fixedHref -replace '/', [IO.Path]::DirectorySeparatorChar)
        $shortTitle = Get-ShortTitleFromHtmlFile $targetPath

        if ($null -eq $shortTitle) {
            # If file is missing, keep existing inner text but keep href fixed.
            return "<a ${before}href=`"$fixedHref`"$after>$inner</a>"
        }

        $label = HtmlEncode $shortTitle

        # Preserve chapter numbering if present
        $strongMatch = [regex]::Match($inner, '^(<strong[^>]*>.*?</strong>)\s*', $options)
        if ($strongMatch.Success) {
            $prefixStrong = $strongMatch.Groups[1].Value
            $newInner = "$prefixStrong $label"
        } else {
            $newInner = $label
        }

        return "<a ${before}href=`"$fixedHref`"$after>$newInner</a>"
    }, $options)

    return $ol
}

function Get-TocJsTail([string]$tocJsPath) {
    $tocJs = Get-FileTextUtf8 $tocJsPath
    $marker = "// Set the current, active page, and reveal it if it's hidden"
    $idx = $tocJs.IndexOf($marker)
    if ($idx -lt 0) {
        throw "Could not find marker in toc.js: $marker"
    }
    return $tocJs.Substring($idx)
}

function Write-LanguageTocJs(
    [Parameter(Mandatory = $true)][string]$outputPath,
    [Parameter(Mandatory = $true)][string]$olHtml,
    [Parameter(Mandatory = $true)][string]$tocJsTail
) {
    $content = @"
// Populate the sidebar
//
// This is a script, and not included directly in the page, to control the total size of the book.
// The TOC contains an entry for each page, so if each page includes a copy of the TOC,
// the total size of the page becomes O(n**2).
class MDBookSidebarScrollbox extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = ``$olHtml``;
        $tocJsTail
"@

    # Normalize line endings to LF in string; PowerShell will write with CRLF, which is fine.
    Set-Content -LiteralPath $outputPath -Value $content -Encoding UTF8
}

$root = (Resolve-Path $BerkPagesRoot).Path

$sourceTocJs = Join-Path $root 'toc.js'
$tocTail = Get-TocJsTail $sourceTocJs

$languages = @(
    @{ code = 'en'; prefix = 'en_';
       partTitles = @{
           'Başlarken' = 'Getting Started'
           'Temel Kavramlar' = 'Core Concepts'
           'İleri Düzey Konular' = 'Advanced Topics'
           'Dil Özellikleri' = 'Language Features'
           'Derleyici ve Araçlar' = 'Compiler & Tools'
           'Örnekler ve Uygulamalar' = 'Examples & Applications'
           'Standart Kütüphane v1.4' = 'Standard Library v1.4'
           'Referans' = 'Reference'
           'Katkıda Bulunma' = 'Contributing'
           'AI/ML & Machine Learning' = 'AI/ML & Machine Learning'
           'Embedded Systems - HAL' = 'Embedded Systems - HAL'
       }
    },
    @{ code = 'ko'; prefix = 'ko_';
       partTitles = @{
           'Başlarken' = '시작하기'
           'Temel Kavramlar' = '기본 개념'
           'İleri Düzey Konular' = '고급 주제'
           'Dil Özellikleri' = '언어 기능'
           'Derleyici ve Araçlar' = '컴파일러 및 도구'
           'Örnekler ve Uygulamalar' = '예제 및 응용'
           'Standart Kütüphane v1.4' = '표준 라이브러리 v1.4'
           'Referans' = '참고'
           'Katkıda Bulunma' = '기여하기'
           'AI/ML & Machine Learning' = 'AI/ML 및 머신러닝'
           'Embedded Systems - HAL' = '임베디드 시스템 - HAL'
       }
    },
    @{ code = 'hi'; prefix = 'hi_';
       partTitles = @{
           'Başlarken' = 'शुरुआत'
           'Temel Kavramlar' = 'मूल अवधारणाएँ'
           'İleri Düzey Konular' = 'उन्नत विषय'
           'Dil Özellikleri' = 'भाषा विशेषताएँ'
           'Derleyici ve Araçlar' = 'कंपाइलर और उपकरण'
           'Örnekler ve Uygulamalar' = 'उदाहरण और अनुप्रयोग'
           'Standart Kütüphane v1.4' = 'मानक लाइब्रेरी v1.4'
           'Referans' = 'संदर्भ'
           'Katkıda Bulunma' = 'योगदान'
           'AI/ML & Machine Learning' = 'AI/ML और मशीन लर्निंग'
           'Embedded Systems - HAL' = 'एम्बेडेड सिस्टम - HAL'
       }
    }
)

foreach ($lang in $languages) {
    $langDir = Join-Path $root $lang.code
    if (-not (Test-Path -LiteralPath $langDir)) {
        Write-Warning "Skipping missing language dir: $langDir"
        continue
    }

    $olLocalized = Build-LocalizedOlHtml -langDir $langDir -langPrefix $lang.prefix -partTitleMap $lang.partTitles

    $outFile = Join-Path $langDir ("{0}_toc.js" -f $lang.code)
    Write-LanguageTocJs -outputPath $outFile -olHtml $olLocalized -tocJsTail $tocTail
    Write-Host "Wrote $outFile"
}
