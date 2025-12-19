/**
 * BERK Language Switcher
 * Adds a language selector button to mdBook pages
 * Auto-detects available languages and allows switching between them
 */

(function() {
    'use strict';

    // Language configuration
    const languageInfo = {
        'tr': { name: 'Türkçe', flag: '🇹🇷', introFile: 'intro.html' },
        'en': { name: 'English', flag: '🇬🇧', introFile: 'en_intro.html' },
        'de': { name: 'Deutsch', flag: '🇩🇪', introFile: 'de_intro.html' },
        'fr': { name: 'Français', flag: '🇫🇷', introFile: 'fr_intro.html' },
        'es': { name: 'Español', flag: '🇪🇸', introFile: 'es_intro.html' },
        'ru': { name: 'Русский', flag: '🇷🇺', introFile: 'ru_intro.html' },
        'zh-CN': { name: '简体中文', flag: '🇨🇳', introFile: 'zh-CN_intro.html' },
        'ja': { name: '日本語', flag: '🇯🇵', introFile: 'ja_intro.html' },
        'ko': { name: '한국어', flag: '🇰🇷', introFile: 'ko_intro.html' },
        'pt-BR': { name: 'Português', flag: '🇧🇷', introFile: 'pt-BR_intro.html' },
        'ar': { name: 'العربية', flag: '🇸🇦', introFile: 'ar_intro.html' },
        'it': { name: 'Italiano', flag: '🇮🇹', introFile: 'it_intro.html' },
        'az': { name: 'Azərbaycan', flag: '🇦🇿', introFile: 'az_intro.html' }
    };

    // Detect current language from page
    function detectCurrentLanguage() {
        const currentPage = window.location.pathname.split('/').pop();
        
        // Check if page has language prefix
        const prefixMatch = currentPage.match(/^([a-z]{2}(-[A-Z]{2})?)_/);
        if (prefixMatch) {
            return prefixMatch[1];
        }
        
        // Check html lang attribute
        const htmlLang = document.documentElement.lang;
        if (htmlLang && languageInfo[htmlLang]) {
            return htmlLang;
        }
        
        // Default to Turkish (original language)
        return 'tr';
    }

    // Get equivalent page in another language
    function getPageInLanguage(targetLang) {
        const currentPage = window.location.pathname.split('/').pop();
        const currentPath = window.location.pathname;
        
        // Remove current language prefix if exists
        let basePage = currentPage.replace(/^[a-z]{2}(-[A-Z]{2})?_/, '');
        
        // Build new page URL
        if (targetLang === 'tr') {
            // Turkish pages don't have prefix
            return currentPath.replace(currentPage, basePage);
        } else {
            return currentPath.replace(currentPage, `${targetLang}_${basePage}`);
        }
    }

    // Check if a language version exists
    async function checkLanguageExists(lang) {
        try {
            const url = getPageInLanguage(lang);
            const response = await fetch(url, { method: 'HEAD' });
            return response.ok;
        } catch (e) {
            return false;
        }
    }

    // Create language switcher UI
    async function createLanguageSwitcher() {
        const currentLang = detectCurrentLanguage();
        const availableLanguages = [];

        // Check which languages are available for current page
        for (const lang of Object.keys(languageInfo)) {
            const exists = await checkLanguageExists(lang);
            if (exists) {
                availableLanguages.push(lang);
            }
        }

        if (availableLanguages.length <= 1) {
            return; // No point showing switcher with only one language
        }

        // Create switcher button
        const switcher = document.createElement('div');
        switcher.id = 'berk-lang-switcher';
        switcher.innerHTML = `
            <button class="berk-lang-btn" title="Change Language">
                ${languageInfo[currentLang]?.flag || '🌐'} ${languageInfo[currentLang]?.name || currentLang}
            </button>
            <div class="berk-lang-dropdown" style="display: none;">
                ${availableLanguages.map(lang => `
                    <a href="${getPageInLanguage(lang)}" class="berk-lang-option ${lang === currentLang ? 'active' : ''}">
                        ${languageInfo[lang].flag} ${languageInfo[lang].name}
                    </a>
                `).join('')}
            </div>
        `;

        // Add styles
        const styles = document.createElement('style');
        styles.textContent = `
            #berk-lang-switcher {
                position: fixed;
                bottom: 20px;
                right: 20px;
                z-index: 9999;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            }
            
            .berk-lang-btn {
                background: linear-gradient(135deg, #00d9ff 0%, #0099cc 100%);
                color: #000;
                border: none;
                padding: 12px 20px;
                border-radius: 25px;
                font-size: 14px;
                font-weight: 600;
                cursor: pointer;
                box-shadow: 0 4px 15px rgba(0,217,255,0.3);
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                gap: 8px;
            }
            
            .berk-lang-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(0,217,255,0.4);
            }
            
            .berk-lang-dropdown {
                position: absolute;
                bottom: 100%;
                right: 0;
                margin-bottom: 10px;
                background: #1a1d2e;
                border: 1px solid rgba(0,217,255,0.3);
                border-radius: 12px;
                overflow: hidden;
                min-width: 160px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            }
            
            .berk-lang-option {
                display: block;
                padding: 12px 16px;
                color: #e0e0e0;
                text-decoration: none;
                font-size: 14px;
                transition: background 0.2s;
                border-bottom: 1px solid rgba(255,255,255,0.05);
            }
            
            .berk-lang-option:last-child {
                border-bottom: none;
            }
            
            .berk-lang-option:hover {
                background: rgba(0,217,255,0.1);
            }
            
            .berk-lang-option.active {
                background: rgba(0,217,255,0.2);
                color: #00d9ff;
            }
            
            @media (max-width: 768px) {
                #berk-lang-switcher {
                    bottom: 10px;
                    right: 10px;
                }
                
                .berk-lang-btn {
                    padding: 10px 15px;
                    font-size: 13px;
                }
            }
        `;
        document.head.appendChild(styles);

        // Add to page
        document.body.appendChild(switcher);

        // Toggle dropdown
        const btn = switcher.querySelector('.berk-lang-btn');
        const dropdown = switcher.querySelector('.berk-lang-dropdown');
        
        btn.addEventListener('click', (e) => {
            e.stopPropagation();
            dropdown.style.display = dropdown.style.display === 'none' ? 'block' : 'none';
        });

        document.addEventListener('click', () => {
            dropdown.style.display = 'none';
        });

        // Save language preference when switching
        dropdown.querySelectorAll('.berk-lang-option').forEach(option => {
            option.addEventListener('click', (e) => {
                const href = option.getAttribute('href');
                const langMatch = href.match(/\/([a-z]{2}(-[A-Z]{2})?)_/) || ['', 'tr'];
                localStorage.setItem('berk-language', langMatch[1] || 'tr');
            });
        });
    }

    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', createLanguageSwitcher);
    } else {
        createLanguageSwitcher();
    }
})();
