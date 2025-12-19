# BERK v0.8.0 Release Notes

**Yayın Tarihi:** 19 Kasım 2025  
**Platform:** Windows x64  
**Dosya Boyutu:** 83 MB (Release build with LLVM statically linked)

## Özellikler

### Derleyici
- ✅ Çift dilli syntax (Türkçe/İngilizce)
- ✅ LLVM Backend ile native kod üretimi
- ✅ C/C++ seviyesinde performans (%98-100)
- ✅ Güçlü tip sistemi
- ✅ Pattern matching
- ✅ Error handling
- ✅ CFG Analysis ve dataflow optimization

### Standard Library (v1.4)
- **18 modül**, **600+ fonksiyon**, **285 KB**
- Bilimsel hesaplama (linalg, stats, optim)
- NumPy/SciPy seviyesinde kütüphaneler

### Runtime (v0.9.0)
- ✅ **JSON Library**: Parse ve serialize (11/11 test)
- ✅ **Crypto Library**: MD5, SHA-256, Base64, Random (13/13 test)
- ✅ **HTTP Library**: REST client with libcurl (11/11 test)

### Hedef Platformlar
19 farklı platform desteği:
- Desktop: Windows, Linux, macOS
- Embedded: ARM, RISC-V, AVR, ESP32
- Mobile: Android, iOS
- WebAssembly

## Kurulum

### Windows

```powershell
# 1. BERK-lang.exe'yi indirin
# 2. Bir klasöre kopyalayın (örn: C:\BERK)
# 3. PATH'e ekleyin

$env:PATH += ";C:\BERK"

# Test edin
BERK-lang --version
```

## Hızlı Başlangıç

### Yöntem 1: REPL (Etkileşimli, Anında Test)
```bash
# REPL'i başlat
BERK-lang repl

# Kod yaz, Enter'a bas - anında çalışır!
>>> yazdır("Merhaba, BERK!")
Merhaba, BERK!
```

### Yöntem 2: JIT Çalıştırma
```bash
# Dosya yaz
echo 'fonksiyon ana() { yazdır("Test!") }' > test.berk

# Direkt çalıştır (derleme gerekmez)
BERK-lang run test.berk
```

### Yöntem 3: Native Executable Derleme
```berk
// merhaba.berk
fonksiyon ana() -> tamsayı
yap
    yazdır("Merhaba, BERK!")
    dön 0
son
```

```bash
# LLVM ile native kod üret
BERK-lang compile merhaba.berk -o merhaba.exe

# Bağımsız çalıştırılabilir dosya
.\merhaba.exe
```

## Dosya Boyutu Hakkında

BERK-lang.exe **83 MB** boyutundadır. Bu büyüklüğün nedenleri:

1. **LLVM Statik Linking** (~60 MB): Native kod üretimi için gerekli
2. **Tüm Optimizasyon Geçişleri**: O0-O3 arası tam optimizasyon desteği
3. **Standard Library v1.4**: 18 modül, 600+ fonksiyon gömülü
4. **Runtime Kütüphaneleri**: JSON, Crypto, HTTP kütüphaneleri dahil
5. **Debug Sembolleri**: Hata ayıklama için semboller korunmuş

**Not:** Tek bir executable olarak tüm bağımlılıklar dahil - harici DLL gerekmez!

## Dokümantasyon Güncellemeleri (19 Aralık 2025)

### Temizlik ve Düzeltmeler

#### 1. `en_` Prefixli Dosyaların Silinmesi
- **815 dosya** silindi
- Eski İngilizce çeviri denemeleri (`en_intro.html`, `en_toc.js` vb.) kaldırıldı
- Artık dil yapısı:
  - 🇹🇷 Türkçe: Ana dizin (`intro.html`, `basics/syntax.html`)
  - 🇬🇧 İngilizce: `/en/` klasörü
  - 🇰🇷 Korece: `/ko/` klasörü
  - 🇮🇳 Hintçe: `/hi/` klasörü

#### 2. Dil Seçici Düzeltmesi
- `index.html` güncellendi
- İngilizce bağlantı: `en_intro.html` → `en/intro.html`

#### 3. HAL Dosyalarındaki Navigasyon Düzeltmesi
- **228 dosya** düzeltildi (stdlib/hal-*.html)
- Fazla `</main></div>` kapanış etiketleri kaldırıldı
- Navigasyon okları (← →) artık doğru konumda
- Tüm diller etkilendi: Türkçe, İngilizce, Korece, Hintçe

---

## Bilinen Sorunlar

- Dosya boyutu GitHub'ın önerilen 50 MB limitinin üzerinde (ancak çalışıyor)
- Linux/macOS için kaynak koddan derleme gereklidir
- UPX sıkıştırması ile boyut ~30-40 MB'a indirilebilir (opsiyonel)

## Gelecek Sürümler

### v0.9.0 (Planlanan)
- SQLite runtime library
- GUI runtime library (Windows native)
- Package manager (bpm)

### v1.0.0 (Planlanan)
- Production-ready release
- Tam platform desteği
- VS Code extension improvements

## İletişim

- **GitHub:** [ArslantasM/berk](https://github.com/ArslantasM/berk)
- **Dokümantasyon:** [GitHub Pages](https://arslantasm.github.io/berk_pages/)

---

**İyi Kodlamalar!** 🚀
