# GitHub Pages Aktivasyon Talimatları

## Adım 1: GitHub Repo Ayarları

1. https://github.com/ArslantasM/berk_pages adresine gidin
2. **Settings** sekmesine tıklayın
3. Sol menüden **Pages** seçin

## Adım 2: GitHub Pages Yapılandırması

Aşağıdaki ayarları yapın:

- **Source**: Deploy from a branch
- **Branch**: `main`
- **Folder**: `/ (root)`

**Save** butonuna tıklayın.

## Adım 3: Bekleyin (2-5 dakika)

GitHub Pages otomatik olarak deploy edilecek. İlk deploy 2-5 dakika sürebilir.

## Adım 4: URL'i Kontrol Edin

Deploy tamamlandığında:
- **Ana sayfa**: https://arslantasm.github.io/berk_pages/
- **İndirme**: https://arslantasm.github.io/berk_pages/releases/BERK-lang.exe

## Adım 5: Custom Domain (Opsiyonel)

Eğer özel bir domain kullanmak isterseniz:

1. Pages ayarlarında **Custom domain** bölümüne domain'inizi girin
2. DNS kayıtlarınızı GitHub'ın IP'lerine yönlendirin:
   ```
   185.199.108.153
   185.199.109.153
   185.199.110.153
   185.199.111.153
   ```
3. CNAME dosyası otomatik oluşturulacak

## Yapılan İşlemler

✅ **berk_pages repository'si oluşturuldu**
- Tam dokümantasyon (HTML)
- BERK-lang.exe (4.5 MB)
- README ve Release Notes
- .nojekyll (Jekyll bypass)

✅ **Ana repoya download linki eklendi**
- intro.md'ye indirme bölümü
- GitHub Pages linkleri
- Hızlı kurulum talimatları

✅ **Git push tamamlandı**
- 119 dosya commit edildi
- 34,659+ satır içerik
- 2.83 MB toplam boyut

## İçerik Güncelleme

Gelecekte içerik güncellemek için:

```bash
# Ana repoda kitapçığı güncelleyin
cd C:\Projects\berkos\berk-lang\book
mdbook build

# berk_pages'e kopyalayın
cd C:\Projects\berkos
Copy-Item -Recurse -Force berk-lang\book\book\* berk_pages\

# Git'e commit edin
cd berk_pages
git add -A
git commit -m "Update documentation"
git push
```

## Release Güncelleme

Yeni BERK-lang.exe sürümü için:

```bash
cd C:\Projects\berkos\berk_pages\releases
Copy-Item ..\..\berk-lang\target\release\BERK-lang.exe .

cd ..
git add releases/BERK-lang.exe
git commit -m "Update BERK-lang.exe to v0.X.Y"
git push
```

## Kontrol Listesi

- [x] berk_pages repository oluşturuldu
- [x] Dokümantasyon eklendi (70+ sayfa)
- [x] BERK-lang.exe eklendi
- [x] README ve Release Notes hazırlandı
- [x] Git push tamamlandı
- [ ] GitHub Pages aktive edildi (manuel yapılacak)
- [ ] URL test edildi
- [ ] İndirme linki test edildi

## Yararlı Linkler

- **Repository**: https://github.com/ArslantasM/berk_pages
- **Pages (yakında)**: https://arslantasm.github.io/berk_pages/
- **Ana Repo**: https://github.com/ArslantasM/berk (private)

---

**Sonraki Adım**: GitHub'da Pages'i aktive edin ve URL'i test edin!
