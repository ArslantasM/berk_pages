[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$BerkPagesRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")),
    
    [Parameter(Mandatory = $false)]
    [string[]]$TargetLanguages = @("en", "ko", "hi"),
    
    [Parameter(Mandatory = $false)]
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ============================================================================
# BERK Code Block Converter: Turkish Keywords → English Keywords
# 
# Purpose: Convert BERK code examples in translated documentation from
#          Turkish syntax to English syntax so that non-Turkish speakers
#          can learn BERK without learning Turkish keywords first.
#
# Scope: Only transforms content within <code> and <pre> blocks
# ============================================================================

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$KeywordMapPath = Join-Path $ScriptDir "berk-keyword-map.json"

if (-not (Test-Path $KeywordMapPath)) {
    throw "Keyword map not found: $KeywordMapPath"
}

$KeywordData = Get-Content $KeywordMapPath -Raw -Encoding UTF8 | ConvertFrom-Json -AsHashtable

# Build combined keyword dictionary (all categories merged)
$AllKeywords = @{}

foreach ($category in @("keywords", "option_result", "data_types", "builtin_functions", 
                        "io_module", "time_module", "fs_module", "dds_keywords", 
                        "hal_keywords", "rtos_keywords")) {
    if ($KeywordData.ContainsKey($category) -and $KeywordData[$category] -is [hashtable]) {
        foreach ($key in $KeywordData[$category].Keys) {
            if ($key -notmatch "^_") {
                $AllKeywords[$key] = $KeywordData[$category][$key]
            }
        }
    }
}

Write-Host "Loaded $($AllKeywords.Count) keyword mappings from $KeywordMapPath"

# Sort by length descending to match longer keywords first (e.g., "değişken" before "değil")
$SortedKeywords = $AllKeywords.Keys | Sort-Object { $_.Length } -Descending

function Convert-BerkCodeToEnglish {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Code
    )
    
    $result = $Code
    
    # Strategy: Replace whole words only, preserving strings and comments
    # We'll use word boundary detection for Turkish characters
    
    foreach ($turkishKw in $SortedKeywords) {
        $englishKw = $AllKeywords[$turkishKw]
        
        # Build regex pattern that matches whole word only
        # Turkish word boundaries include: start/end of string, whitespace, punctuation, operators
        $escapedTr = [regex]::Escape($turkishKw)
        
        # Pattern: word boundary before and after
        # Note: \b doesn't work well with Turkish chars, so we use lookarounds
        $pattern = "(?<![a-zA-ZğüşöçıİĞÜŞÖÇ_0-9])$escapedTr(?![a-zA-ZğüşöçıİĞÜŞÖÇ_0-9])"
        
        $result = [regex]::Replace($result, $pattern, $englishKw, [Text.RegularExpressions.RegexOptions]::None)
    }
    
    return $result
}

function Process-HtmlFile {
    param(
        [Parameter(Mandatory = $true)]
        [string]$FilePath
    )
    
    $content = Get-Content $FilePath -Raw -Encoding UTF8
    $originalContent = $content
    $modified = $false
    
    # Pattern to match code blocks: <code>...</code> and <pre>...</pre>
    # Also handles <pre><code>...</code></pre>
    
    # Process <code> blocks (including those inside <pre>)
    $codePattern = '(<code[^>]*>)(.*?)(</code>)'
    $content = [regex]::Replace($content, $codePattern, {
        param($m)
        $openTag = $m.Groups[1].Value
        $codeContent = $m.Groups[2].Value
        $closeTag = $m.Groups[3].Value
        
        # Skip if it looks like inline code with just a class name or short text
        # Only process if it contains BERK-like code patterns
        if ($codeContent -match '(fonksiyon|işlev|değişken|eğer|için|döngü|yaz|yazdır|dön|son|yap|geri dön|hata|Sayı|metin)') {
            $converted = Convert-BerkCodeToEnglish $codeContent
            if ($converted -ne $codeContent) {
                $script:modified = $true
                return "$openTag$converted$closeTag"
            }
        }
        return $m.Value
    }, [Text.RegularExpressions.RegexOptions]::Singleline)
    
    # Process standalone <pre> blocks (without nested code tags already processed)
    $prePattern = '(<pre[^>]*>)(?!<code)(.*?)(</pre>)'
    $content = [regex]::Replace($content, $prePattern, {
        param($m)
        $openTag = $m.Groups[1].Value
        $preContent = $m.Groups[2].Value
        $closeTag = $m.Groups[3].Value
        
        if ($preContent -match '(fonksiyon|işlev|değişken|eğer|için|döngü|yaz|yazdır|dön|son|yap|geri dön|hata|Sayı|metin)') {
            $converted = Convert-BerkCodeToEnglish $preContent
            if ($converted -ne $preContent) {
                $script:modified = $true
                return "$openTag$converted$closeTag"
            }
        }
        return $m.Value
    }, [Text.RegularExpressions.RegexOptions]::Singleline)
    
    if ($content -ne $originalContent) {
        if ($DryRun) {
            Write-Host "[DRY-RUN] Would modify: $FilePath" -ForegroundColor Yellow
        } else {
            Set-Content $FilePath -Value $content -Encoding UTF8 -NoNewline
            Write-Host "[MODIFIED] $FilePath" -ForegroundColor Green
        }
        return $true
    }
    return $false
}

# Main execution
$root = (Resolve-Path $BerkPagesRoot).Path
$totalModified = 0

foreach ($lang in $TargetLanguages) {
    $langDir = Join-Path $root $lang
    
    if (-not (Test-Path $langDir)) {
        Write-Warning "Language directory not found, skipping: $langDir"
        continue
    }
    
    Write-Host "`n Processing language: $lang" -ForegroundColor Cyan
    Write-Host "Directory: $langDir"
    
    $htmlFiles = Get-ChildItem -Path $langDir -Recurse -Filter "*.html" -File
    $langModified = 0
    
    foreach ($file in $htmlFiles) {
        try {
            if (Process-HtmlFile -FilePath $file.FullName) {
                $langModified++
            }
        } catch {
            Write-Warning "Error processing $($file.FullName): $_"
        }
    }
    
    Write-Host "  Modified $langModified files in $lang folder"
    $totalModified += $langModified
}

Write-Host "`n════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host " Conversion complete!" -ForegroundColor Green
Write-Host " Total files modified: $totalModified"
if ($DryRun) {
    Write-Host " (DRY RUN - no files were actually changed)" -ForegroundColor Yellow
}
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
