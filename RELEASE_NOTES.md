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

```berk
// merhaba.berk
fonksiyon ana() -> tamsayı
yap
    yazdır("Merhaba, BERK!")
    dön 0
son
```

```bash
BERK-lang merhaba.berk -o merhaba.exe
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
