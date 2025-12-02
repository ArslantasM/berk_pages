# BERK Pages CSS Structure Validator
# Tum HTML sayfalarinda kritik CSS/JS yapilarini kontrol eder

param(
    [string]$Path = "stdlib",
    [switch]$Verbose
)

$ErrorCount = 0
$WarningCount = 0
$PassCount = 0

# Test edilecek kritik yapilar
$RequiredElements = @{
    "localStorage Quote Cleanup" = "theme\.startsWith"
    "Theme Initialization" = "prefers-color-scheme: dark"
    "Sidebar Toggle Checkbox" = "sidebar-toggle-anchor"
    "Sidebar Resize Handle" = "sidebar-resize-handle"
    "Menu Bar Hover Placeholder" = "menu-bar-hover-placeholder"
    "Default Theme ID" = 'id="default_theme"'
    "Sidebar Label Toggle" = 'for="sidebar-toggle-anchor"'
    "Mobile Navigation" = "mobile-nav-chapters"
    "Desktop Navigation" = "nav-wide-wrapper"
    "Playground Copyable" = "playground_copyable = true"
}

# Olmamasi gereken anti-patterns
$AntiPatterns = @{
    "Old Auto Theme ID" = 'id="auto">Auto<'
    "Button Sidebar Toggle" = 'button.*id="sidebar-toggle"'
}

function Test-HTMLStructure {
    param([string]$FilePath)
    
    $FileName = Split-Path $FilePath -Leaf
    $Content = Get-Content $FilePath -Raw -Encoding UTF8
    
    $FileErrors = @()
    $FileWarnings = @()
    $FilePasses = @()
    
    Write-Host "`n========================================================" -ForegroundColor Cyan
    Write-Host "  Testing: $FileName" -ForegroundColor White
    Write-Host "========================================================" -ForegroundColor Cyan
    
    # Required elements kontrolu
    foreach ($Check in $RequiredElements.GetEnumerator()) {
        $CheckName = $Check.Key
        $Pattern = $Check.Value
        
        if ($Content -match $Pattern) {
            $FilePasses += $CheckName
            Write-Host "  [OK] $CheckName" -ForegroundColor Green
        }
        else {
            $FileErrors += $CheckName
            Write-Host "  [FAIL] $CheckName - EKSIK!" -ForegroundColor Red
        }
    }
    
    # Anti-pattern kontrolu
    foreach ($Check in $AntiPatterns.GetEnumerator()) {
        $CheckName = $Check.Key
        $Pattern = $Check.Value
        
        if ($Content -match $Pattern) {
            $FileWarnings += $CheckName
            Write-Host "  [WARN] $CheckName - ESKI YAPI BULUNDU!" -ForegroundColor Yellow
        }
    }
    
    # Dosya ozeti
    $TotalChecks = $RequiredElements.Count
    $PassRate = [Math]::Round(($FilePasses.Count / $TotalChecks) * 100, 1)
    
    Write-Host "`n  Sonuc: " -NoNewline
    if ($FileErrors.Count -eq 0 -and $FileWarnings.Count -eq 0) {
        Write-Host "MUKEMMEL" -ForegroundColor Green
    }
    elseif ($FileErrors.Count -eq 0) {
        Write-Host "GECER (Uyarilarla)" -ForegroundColor Yellow
    }
    else {
        Write-Host "BASARISIZ" -ForegroundColor Red
    }
    
    Write-Host "  Basari Orani: $PassRate% ($($FilePasses.Count)/$TotalChecks)" -ForegroundColor Cyan
    
    return @{
        FileName = $FileName
        Errors = $FileErrors
        Warnings = $FileWarnings
        Passes = $FilePasses
        PassRate = $PassRate
    }
}

# Ana calistirma
Write-Host "`n============================================================" -ForegroundColor Magenta
Write-Host "  BERK Pages CSS/JS Structure Validator" -ForegroundColor Magenta
Write-Host "============================================================" -ForegroundColor Magenta

$TargetPath = Join-Path $PSScriptRoot $Path
$HTMLFiles = Get-ChildItem -Path $TargetPath -Filter "*.html" -File | 
             Where-Object { $_.Name -match '^ai-.*\.html$' } |
             Sort-Object Name

if ($HTMLFiles.Count -eq 0) {
    Write-Host "`nHic HTML dosyasi bulunamadi: $TargetPath" -ForegroundColor Red
    exit 1
}

Write-Host "`nTest Dizini: $TargetPath" -ForegroundColor White
Write-Host "Dosya Sayisi: $($HTMLFiles.Count)" -ForegroundColor White

$Results = @()

foreach ($File in $HTMLFiles) {
    $Result = Test-HTMLStructure -FilePath $File.FullName
    $Results += $Result
    
    $ErrorCount += $Result.Errors.Count
    $WarningCount += $Result.Warnings.Count
    $PassCount += $Result.Passes.Count
}

# Genel Ozet
Write-Host "`n`n============================================================" -ForegroundColor Magenta
Write-Host "  GENEL OZET" -ForegroundColor Magenta
Write-Host "============================================================" -ForegroundColor Magenta

$TotalChecks = $RequiredElements.Count * $HTMLFiles.Count
$OverallPassRate = [Math]::Round(($PassCount / $TotalChecks) * 100, 1)

Write-Host "`nIstatistikler:" -ForegroundColor Cyan
Write-Host "  Test Edilen Dosya  : $($HTMLFiles.Count)" -ForegroundColor White
Write-Host "  Toplam Kontrol     : $TotalChecks" -ForegroundColor White
Write-Host "  Basarili           : $PassCount" -ForegroundColor Green
Write-Host "  Hata               : $ErrorCount" -ForegroundColor $(if ($ErrorCount -eq 0) { "Green" } else { "Red" })
Write-Host "  Uyari              : $WarningCount" -ForegroundColor $(if ($WarningCount -eq 0) { "Green" } else { "Yellow" })
Write-Host "  Genel Basari Orani : $OverallPassRate%" -ForegroundColor $(if ($OverallPassRate -eq 100) { "Green" } elseif ($OverallPassRate -ge 90) { "Yellow" } else { "Red" })

# Detayli tablo
Write-Host "`nDosya Bazinda Sonuclar:" -ForegroundColor Cyan
Write-Host ""

$TableData = $Results | ForEach-Object {
    $StatusSymbol = if ($_.Errors.Count -eq 0 -and $_.Warnings.Count -eq 0) { "OK" } 
                    elseif ($_.Errors.Count -eq 0) { "WARN" } 
                    else { "FAIL" }
    
    [PSCustomObject]@{
        "Dosya" = $_.FileName
        "Basari" = "$($_.Passes.Count)/$($RequiredElements.Count)"
        "Yuzde" = "$($_.PassRate)%"
        "Hata" = $_.Errors.Count
        "Uyari" = $_.Warnings.Count
        "Durum" = $StatusSymbol
    }
}

$TableData | Format-Table -AutoSize

# Hatali dosyalar detayi
if ($ErrorCount -gt 0) {
    Write-Host "`nHatali Dosyalar:" -ForegroundColor Red
    foreach ($Result in $Results) {
        if ($Result.Errors.Count -gt 0) {
            Write-Host "`n  $($Result.FileName):" -ForegroundColor Yellow
            foreach ($Error in $Result.Errors) {
                Write-Host "    - $Error" -ForegroundColor Red
            }
        }
    }
}

# Uyarili dosyalar
if ($WarningCount -gt 0) {
    Write-Host "`nUyari Alan Dosyalar:" -ForegroundColor Yellow
    foreach ($Result in $Results) {
        if ($Result.Warnings.Count -gt 0) {
            Write-Host "`n  $($Result.FileName):" -ForegroundColor Yellow
            foreach ($Warning in $Result.Warnings) {
                Write-Host "    - $Warning" -ForegroundColor Yellow
            }
        }
    }
}

# Nihai sonuc
Write-Host "`n========================================================" -ForegroundColor Cyan

if ($ErrorCount -eq 0 -and $WarningCount -eq 0) {
    Write-Host "`nTUM TESTLER BASARILI! Tum sayfalar dogru CSS yapisina sahip." -ForegroundColor Green
    exit 0
}
elseif ($ErrorCount -eq 0) {
    Write-Host "`nTestler gecti ama bazi uyarilar var. Inceleme onerilir." -ForegroundColor Yellow
    exit 0
}
else {
    Write-Host "`nTESTLER BASARISIZ! $ErrorCount hata bulundu." -ForegroundColor Red
    exit 1
}
