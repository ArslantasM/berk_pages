# BERK Programlama Dili - Dokümantasyon ve İndirme

Bu repository, BERK Programlama Dili'nin resmi dokümantasyonu ve indirme dosyalarını içerir.

##  Dokümantasyon

Tam dokümantasyon için GitHub Pages'i ziyaret edin:  
**https://arslantasm.github.io/berk_pages/**

##  İndirme

### BERK v1.0.0 - Production Ready 

**Windows x64:**
- [BERK-lang.exe](./releases/BERK-lang.exe) (2.2 MB) - Derleyici
- [berk-lsp.exe](./releases/berk-lsp.exe) (1.2 MB) - Language Server
- [berk-repl.exe](./releases/berk-repl.exe) (464 KB) - REPL

**Özellikler:**
-  İki dilli syntax (Türkçe/İngilizce)
-  LLVM 17 backend - C/C++ seviyesinde performans
-  19 hedef platform desteği
-  75 modül (42 stdlib + 33 HAL)
-  4100+ fonksiyon
-  Rust seviyesinde bellek güvenliği
-  263x daha hızlı region memory
-  Gömülü sistemler: 7 platform (ESP32, STM32F4, RP2040, nRF52, GD32, Nuvoton, Arduino)

##  Hızlı Başlangıç

### Kurulum
```bash
# 1. BERK-lang.exe'yi indirin
# 2. PATH'e ekleyin
```

### Kullanım

**REPL (Etkileşimli):**
```bash
BERK-lang repl
>>> yazdır("Merhaba!")
```

**Direkt Çalıştırma:**
```bash
BERK-lang run program.berk
```

**Native Derleme:**
```bash
BERK-lang compile program.berk -o program.exe
.\program.exe
```

##  İçerik

Bu repository şunları içerir:

- **Modern Landing Page** - Animasyonlu gradient arka plan ile etkileyici giriş sayfası
- **Kapsamlı HTML Dokümantasyon** - 280+ sayfa, iki dilli (TR/EN)
- **BERK Derleyici Suite** - 3 ayrı binary (compiler, LSP, REPL)
- **HAL Dokümantasyonu** - 33 modül, 7 platform için gömülü sistemler desteği
- **Stdlib Referansı** - 75 modül, 4100+ fonksiyon detaylı API dökümanı
- **Örnek Kodlar** - Her modül için çalışan örnekler

##  Neden BERK?

- **Bilimsel Hesaplama:** NumPy/SciPy/MATLAB seviyesi kütüphaneler (linalg, stats, optim)
- **Web Development:** HTTP, JSON, WebSocket, PostgreSQL, Redis desteği
- **Gömülü Sistemler:** Bare-metal, RTOS, interrupt handling, 2-5 KB runtime
- **Production Ready:** %99 tamamlanma, tüm major özellikler stable

##  Bağlantılar

- **Ana Repo (Private):** [ArslantasM/berk](https://github.com/ArslantasM/berk)
- **Dokümantasyon:** [GitHub Pages](https://arslantasm.github.io/berk_pages/)
- **İletişim:** GitHub Issues

##  Lisans

BERK Programlama Dili ve dokümantasyonu ArslantasM tarafından geliştirilmektedir.

---

**Son Güncelleme:** 2 Aralık 2025  
**Versiyon:** v1.0.0 - Production Ready 
