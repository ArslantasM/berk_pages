# BERK GitHub Pages - Complete Documentation Structure

## Project Status: v1.0.0 Production-Ready

This is the complete documentation site for BERK Programming Language.

## Structure

```
berk_pages/
├── language-selector.html      # NEW: Landing page with language selection
├── index.html                  # Redirects to language-selector.html
├── index-tr.html              # Turkish documentation home
├── index-en.html              # English documentation home
├── tr/                        # Turkish documentation
│   ├── intro.html
│   ├── installation.html
│   ├── hello-world.html
│   ├── basics/
│   ├── features/
│   ├── stdlib/               # 28 modules documented
│   └── ...
├── en/                        # English documentation
│   ├── intro.html
│   ├── installation.html
│   ├── hello-world.html
│   ├── basics/
│   ├── features/
│   ├── stdlib/               # 28 modules documented
│   └── ...
└── shared/                   # Shared assets
    ├── css/
    ├── js/
    ├── images/
    └── fonts/
```

## BERK v1.0.0 Features

### Core Language (100%)
- ✅ 730+ stdlib functions across 28 modules
- ✅ Ownership & borrow checker (98/98 tests)
- ✅ Region memory (263x malloc/free speedup)
- ✅ LLVM 17.0.6 backend
- ✅ 19 platform support
- ✅ Conditional compilation (#[cfg])

### Standard Library Modules (28)

**Core System (14 modules):**
1. io - Input/Output operations
2. fs - File system
3. sys - System information
4. string - String manipulation
5. collections - Data structures
6. iter - Iterators
7. result - Result types
8. fmt - Formatting
9. time - Time operations
10. random - Random generation
11. thread - Threading
12. terminal - Terminal control
13. math - Mathematics
14. complex - Complex numbers

**Scientific Computing (6 modules):**
15. linalg - Linear algebra
16. stats - Statistics
17. optim - Optimization
18. physics - Physics simulations
19. math_3d - 3D mathematics
20. color - Color utilities

**Web & Data (12 modules):**
21. http - HTTP server/client
22. json - JSON parsing
23. network - TCP/UDP/DNS
24. crypto - Cryptography
25. sqlite - SQLite database
26. xml - XML parsing
27. yaml - YAML parsing
28. csv - CSV parsing
29. encoding - Base64, URL encoding
30. compression - Gzip, deflate
31. logging - Logging system
32. regex - Regular expressions

**Graphics & Game Dev (7 modules):**
33. graphics - 2D/3D rendering
34. gui - GUI framework
35. audio - Audio system
36. physics2d - 2D physics
37. image - Image processing
38. mesh - 3D mesh operations
39. cad3d - CAD operations

**Embedded (61 platform modules):**
40-100. ESP32, STM32, Arduino, RP2040, nRF52, GD32, RISC-V HAL modules

### Documentation Sections

**Turkish (tr/):**
- Giriş ve Kurulum
- İlk Program
- Temel Kavramlar
- Kontrol Akışı
- Fonksiyonlar
- Veri Yapıları
- Hata Yönetimi
- Modüller
- Standart Kütüphane (28 modül)
- Gömülü Sistemler
- Örnekler
- Referans

**English (en/):**
- Introduction and Installation
- First Program
- Basic Concepts
- Control Flow
- Functions
- Data Structures
- Error Handling
- Modules
- Standard Library (28 modules)
- Embedded Systems
- Examples
- Reference

## Technology Stack

- HTML5 + CSS3
- Vanilla JavaScript (no frameworks)
- mdBook-inspired design
- Responsive layout
- Dark/Light theme support
- Search functionality
- Code highlighting (highlight.js)

## Build Status

- Language selector: ✅ Complete
- Index redirect: ⏳ Pending
- Turkish docs: ⏳ In progress
- English docs: ⏳ In progress
- Stdlib API docs: ⏳ In progress (28 modules)
- Examples: ⏳ In progress
- Search: ✅ Available (needs indexing)

## Next Steps

1. Create index.html redirect
2. Build index-tr.html (Turkish home)
3. Build index-en.html (English home)
4. Update existing pages with language switcher
5. Create stdlib documentation for 28 modules
6. Add code examples
7. Update search index
8. Test responsive design
9. Deploy to GitHub Pages

## License

GPL-3.0 - Copyright (C) 2025 Mustafa Barış Arslantaş
