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
        this.innerHTML = '<ol class="chapter"><li class="chapter-item affix "><a href="intro.html">Giriş</a></li><li class="chapter-item affix "><li class="spacer"></li><li class="chapter-item affix "><li class="part-title">Başlarken</li><li class="chapter-item "><a href="installation.html"><strong aria-hidden="true">1.</strong> Kurulum</a></li><li class="chapter-item "><a href="hello-world.html"><strong aria-hidden="true">2.</strong> Merhaba Dünya!</a></li><li class="chapter-item "><a href="first-program.html"><strong aria-hidden="true">3.</strong> İlk Programınızı Yazmak</a></li><li class="chapter-item affix "><li class="part-title">Temel Kavramlar</li><li class="chapter-item "><a href="basics/syntax.html"><strong aria-hidden="true">4.</strong> Sözdizimi ve Yapı</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="basics/variables.html"><strong aria-hidden="true">4.1.</strong> Değişkenler ve Sabitler</a></li><li class="chapter-item "><a href="basics/data-types.html"><strong aria-hidden="true">4.2.</strong> Veri Tipleri</a></li><li class="chapter-item "><a href="basics/operators.html"><strong aria-hidden="true">4.3.</strong> Operatörler</a></li><li class="chapter-item "><a href="basics/comments.html"><strong aria-hidden="true">4.4.</strong> Yorumlar</a></li></ol></li><li class="chapter-item "><a href="control-flow/index.html"><strong aria-hidden="true">5.</strong> Kontrol Yapıları</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="control-flow/if-else.html"><strong aria-hidden="true">5.1.</strong> If-Else Koşulları</a></li><li class="chapter-item "><a href="control-flow/loops.html"><strong aria-hidden="true">5.2.</strong> Döngüler</a></li><li class="chapter-item "><a href="control-flow/pattern-matching.html"><strong aria-hidden="true">5.3.</strong> Pattern Matching</a></li></ol></li><li class="chapter-item "><a href="functions/index.html"><strong aria-hidden="true">6.</strong> Fonksiyonlar</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="functions/defining.html"><strong aria-hidden="true">6.1.</strong> Fonksiyon Tanımlama</a></li><li class="chapter-item "><a href="functions/parameters.html"><strong aria-hidden="true">6.2.</strong> Parametreler ve Dönüş Değerleri</a></li><li class="chapter-item "><a href="functions/scope.html"><strong aria-hidden="true">6.3.</strong> Yerel ve Global Değişkenler</a></li></ol></li><li class="chapter-item "><li class="part-title">İleri Düzey Konular</li><li class="chapter-item "><a href="data-structures/index.html"><strong aria-hidden="true">7.</strong> Veri Yapıları</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="data-structures/lists.html"><strong aria-hidden="true">7.1.</strong> Listeler</a></li><li class="chapter-item "><a href="data-structures/tuples.html"><strong aria-hidden="true">7.2.</strong> Demetler</a></li><li class="chapter-item "><a href="data-structures/structs.html"><strong aria-hidden="true">7.3.</strong> Struct Yapıları</a></li></ol></li><li class="chapter-item "><a href="error-handling/index.html"><strong aria-hidden="true">8.</strong> Hata Yönetimi</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="error-handling/try-catch.html"><strong aria-hidden="true">8.1.</strong> Try-Catch Blokları</a></li><li class="chapter-item "><a href="error-handling/error-types.html"><strong aria-hidden="true">8.2.</strong> Hata Türleri</a></li></ol></li><li class="chapter-item "><a href="modules/index.html"><strong aria-hidden="true">9.</strong> Modüller ve Organizasyon</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="modules/system.html"><strong aria-hidden="true">9.1.</strong> Modül Sistemi</a></li><li class="chapter-item "><a href="modules/import-export.html"><strong aria-hidden="true">9.2.</strong> Import ve Export</a></li></ol></li><li class="chapter-item "><li class="part-title">Dil Özellikleri</li><li class="chapter-item "><a href="features/bilingual.html"><strong aria-hidden="true">10.</strong> İki Dilli Syntax (Türkçe/İngilizce)</a></li><li class="chapter-item "><a href="features/memory-safety.html"><strong aria-hidden="true">11.</strong> Bellek Güvenliği</a></li><li class="chapter-item "><a href="features/type-system.html"><strong aria-hidden="true">12.</strong> Tip Sistemi</a></li><li class="chapter-item "><a href="features/strings.html"><strong aria-hidden="true">13.</strong> String İşlemleri</a></li><li class="chapter-item affix "><li class="part-title">Derleyici ve Araçlar</li><li class="chapter-item "><a href="compiler/overview.html"><strong aria-hidden="true">14.</strong> BERK Derleyicisi</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="compiler/compilation.html"><strong aria-hidden="true">14.1.</strong> Derleme Süreci</a></li><li class="chapter-item "><a href="compiler/optimizations.html"><strong aria-hidden="true">14.2.</strong> Optimizasyon Seviyeleri</a></li><li class="chapter-item "><a href="compiler/cross-compile.html"><strong aria-hidden="true">14.3.</strong> Cross-Compilation</a></li></ol></li><li class="chapter-item "><a href="tools/repl.html"><strong aria-hidden="true">15.</strong> REPL - Etkileşimli Kabuk</a></li><li class="chapter-item "><a href="tools/vscode-extension.html"><strong aria-hidden="true">16.</strong> VS Code Eklentisi</a></li><li class="chapter-item "><a href="tools/debugging.html"><strong aria-hidden="true">17.</strong> Hata Ayıklama</a></li><li class="chapter-item affix "><li class="part-title">Örnekler ve Uygulamalar</li><li class="chapter-item "><a href="examples/index.html"><strong aria-hidden="true">18.</strong> Örnek Programlar</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="examples/calculations.html"><strong aria-hidden="true">18.1.</strong> Basit Hesaplamalar</a></li><li class="chapter-item "><a href="examples/string-ops.html"><strong aria-hidden="true">18.2.</strong> String İşlemleri</a></li><li class="chapter-item "><a href="examples/file-ops.html"><strong aria-hidden="true">18.3.</strong> Dosya İşlemleri</a></li><li class="chapter-item "><a href="examples/web-server.html"><strong aria-hidden="true">18.4.</strong> Web Sunucu Örneği</a></li></ol></li><li class="chapter-item "><li class="part-title">Standart Kütüphane v1.4 🆕</li><li class="chapter-item "><a href="stdlib/overview.html"><strong aria-hidden="true">19.</strong> Kütüphane Genel Bakış</a></li><li class="chapter-item "><a href="stdlib/io.html"><strong aria-hidden="true">20.</strong> io - Giriş/Çıkış</a></li><li class="chapter-item "><a href="stdlib/string.html"><strong aria-hidden="true">21.</strong> string - String İşlemleri</a></li><li class="chapter-item "><a href="stdlib/collections.html"><strong aria-hidden="true">22.</strong> collections - Koleksiyonlar</a></li><li class="chapter-item "><a href="stdlib/result.html"><strong aria-hidden="true">23.</strong> result - Hata Yönetimi</a></li><li class="chapter-item "><a href="stdlib/time.html"><strong aria-hidden="true">24.</strong> time - Zaman İşlemleri</a></li><li class="chapter-item "><a href="stdlib/fs.html"><strong aria-hidden="true">25.</strong> fs - Dosya Sistemi</a></li><li class="chapter-item "><a href="stdlib/thread.html"><strong aria-hidden="true">26.</strong> thread - Çoklu İş Parçacığı</a></li><li class="chapter-item "><a href="stdlib/sys.html"><strong aria-hidden="true">27.</strong> sys - Sistem Bilgisi</a></li><li class="chapter-item "><a href="stdlib/terminal.html"><strong aria-hidden="true">28.</strong> terminal - Terminal Kontrolü</a></li><li class="chapter-item "><a href="stdlib/iter.html"><strong aria-hidden="true">29.</strong> iter - İteratörler</a></li><li class="chapter-item "><a href="stdlib/fmt.html"><strong aria-hidden="true">30.</strong> fmt - Gelişmiş Formatlama</a></li><li class="chapter-item "><a href="stdlib/math.html"><strong aria-hidden="true">31.</strong> math - Matematik</a></li><li class="chapter-item "><a href="stdlib/physics.html"><strong aria-hidden="true">32.</strong> physics - Fizik</a></li><li class="chapter-item "><a href="stdlib/complex.html"><strong aria-hidden="true">33.</strong> complex - Kompleks Sayılar</a></li><li class="chapter-item "><a href="stdlib/random.html"><strong aria-hidden="true">34.</strong> random - Rastgele Sayılar</a></li><li class="chapter-item "><a href="stdlib/linalg.html"><strong aria-hidden="true">35.</strong> linalg - Doğrusal Cebir</a></li><li class="chapter-item "><a href="stdlib/stats.html"><strong aria-hidden="true">36.</strong> stats - İstatistik</a></li><li class="chapter-item "><a href="stdlib/optim.html"><strong aria-hidden="true">37.</strong> optim - Optimizasyon</a></li><li class="chapter-item affix "><li class="part-title">Referans</li><li class="chapter-item "><a href="reference/keywords.html"><strong aria-hidden="true">38.</strong> Anahtar Kelimeler</a></li><li class="chapter-item "><a href="reference/operator-precedence.html"><strong aria-hidden="true">39.</strong> Operatör Önceliği</a></li><li class="chapter-item "><a href="reference/std-library.html"><strong aria-hidden="true">40.</strong> Standart Kütüphane API</a></li><li class="chapter-item "><a href="reference/error-messages.html"><strong aria-hidden="true">41.</strong> Hata Mesajları</a></li><li class="chapter-item affix "><li class="part-title">Katkıda Bulunma</li><li class="chapter-item "><a href="contributing/setup.html"><strong aria-hidden="true">42.</strong> Geliştirme Ortamı Kurulumu</a></li><li class="chapter-item "><a href="contributing/code.html"><strong aria-hidden="true">43.</strong> Kod Katkısı Nasıl Yapılır</a></li><li class="chapter-item "><a href="contributing/docs.html"><strong aria-hidden="true">44.</strong> Dokümantasyon Katkısı</a></li><li class="chapter-item affix "><li class="spacer"></li><li class="chapter-item affix "><a href="faq.html">Sık Sorulan Sorular</a></li><li class="chapter-item affix "><a href="roadmap.html">Yol Haritası</a></li><li class="chapter-item affix "><a href="changelog.html">Changelog</a></li></ol>';
        // Set the current, active page, and reveal it if it's hidden
        let current_page = document.location.href.toString().split("#")[0].split("?")[0];
        if (current_page.endsWith("/")) {
            current_page += "index.html";
        }
        var links = Array.prototype.slice.call(this.querySelectorAll("a"));
        var l = links.length;
        for (var i = 0; i < l; ++i) {
            var link = links[i];
            var href = link.getAttribute("href");
            if (href && !href.startsWith("#") && !/^(?:[a-z+]+:)?\/\//.test(href)) {
                link.href = path_to_root + href;
            }
            // The "index" page is supposed to alias the first chapter in the book.
            if (link.href === current_page || (i === 0 && path_to_root === "" && current_page.endsWith("/index.html"))) {
                link.classList.add("active");
                var parent = link.parentElement;
                if (parent && parent.classList.contains("chapter-item")) {
                    parent.classList.add("expanded");
                }
                while (parent) {
                    if (parent.tagName === "LI" && parent.previousElementSibling) {
                        if (parent.previousElementSibling.classList.contains("chapter-item")) {
                            parent.previousElementSibling.classList.add("expanded");
                        }
                    }
                    parent = parent.parentElement;
                }
            }
        }
        // Track and set sidebar scroll position
        this.addEventListener('click', function(e) {
            if (e.target.tagName === 'A') {
                sessionStorage.setItem('sidebar-scroll', this.scrollTop);
            }
        }, { passive: true });
        var sidebarScrollTop = sessionStorage.getItem('sidebar-scroll');
        sessionStorage.removeItem('sidebar-scroll');
        if (sidebarScrollTop) {
            // preserve sidebar scroll position when navigating via links within sidebar
            this.scrollTop = sidebarScrollTop;
        } else {
            // scroll sidebar to current active section when navigating via "next/previous chapter" buttons
            var activeSection = document.querySelector('#sidebar .active');
            if (activeSection) {
                activeSection.scrollIntoView({ block: 'center' });
            }
        }
        // Toggle buttons
        var sidebarAnchorToggles = document.querySelectorAll('#sidebar a.toggle');
        function toggleSection(ev) {
            ev.currentTarget.parentElement.classList.toggle('expanded');
        }
        Array.from(sidebarAnchorToggles).forEach(function (el) {
            el.addEventListener('click', toggleSection);
        });
    }
}
window.customElements.define("mdbook-sidebar-scrollbox", MDBookSidebarScrollbox);
