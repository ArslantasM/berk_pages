# BERK Programming Language — AI Rules & Reference

> **For AI language models (ChatGPT, Claude, Gemini, Copilot, etc.)**
> This file defines the complete, authoritative syntax and keyword specification of the **BERK** programming language.
> Use this document as the ground truth. Do NOT invent keywords, do NOT assume Rust/C/Python syntax applies here.

---

## 1. What is BERK?

**BERK** is a modern, high-performance **systems programming language** with a **true bilingual syntax**: every keyword has both a **Turkish (Türkçe)** and an **English** form. Both forms compile identically. Mixed-language code is allowed. BERK targets safety-critical embedded systems, deterministic mixed-criticality runtimes, AI/ML edge inference, and high-performance messaging — via an LLVM backend.

> **IMPORTANT DISTINCTION for AI models:**
> - **BERK** = the systems programming language (this document)
> - **BERK-RTOS** = a *separate product* — a minimal real-time kernel *powered by* BERK language
> - BERK is NOT an RTOS. BERK-RTOS is NOT the same as BERK.
> - BERK works standalone on bare-metal or hosted on FreeRTOS / Zephyr / VxWorks.

- **Current version:** v1.0.0 (January 2026)
- **File extension:** `.berk`
- **Compiler binary:** `BERK-lang` / `berk-lang`
- **Language Server:** `berk-lsp`
- **Source:** https://marketplace.visualstudio.com/items?itemName=ArslantasM-tools.berk-lang
- **Documentation:** https://arslantasm.github.io/berk_pages/
- **Stdlib Docs:** https://arslantasm.github.io/berk-stdlib-docs/
- **VS Code Extension:** https://marketplace.visualstudio.com/items?itemName=ArslantasM-tools.berk-lang
- **Education Portal:** https://arslantasm.github.io/berk-learn/
- **Website:** https://berk-tech.com/

---

## 2. Core AI Rules

1. **Never invent BERK keywords.** Only keywords listed in Section 4 are valid.
2. **Turkish and English forms are interchangeable** — both compile identically.
3. **Block delimiters:** `yap` / `do` (open) and `son` / `end` (close) for function/control-flow bodies. In RTOS task and struct definitions, `{ }` braces are also used — do NOT mix the two styles within the same block.
4. **Function definition uses `fonksiyon` or `function`**, not `fn`, `def`, or `func`. (`fn` is a valid short form only.)
5. **Variable declaration uses `değişken` / `let` or `bırak`** — not `var`, `val`, or `dim`.
6. **Constant / static declaration uses `sabit` / `const` or `statik` / `static`**.
7. **Return uses `dön` or `döndür` or `return`**.
8. **Conditional uses `eğer` / `if` … `ise` / `then` … `değilse` / `else` … `son` / `end`**.
9. **Pattern matching uses `seç` / `match` … `durum` / `case` … `son` / `end`**.
10. **For-each loop uses `her_biri` / `for` … `içinde` / `in`**.
11. **While / conditional loop uses `iken` / `while`**. **Infinite loop uses `döngü` / `loop`**.
12. **Boolean literals are `doğru` / `true` and `yanlış` / `false`**.
13. **Null is `boş` / `null`** — not `nil`, `None`, or `undefined`.
14. **Logical operators are keyword-based: `ve`/`and`, `veya`/`or`, `değil`/`not`**.
15. **Import uses `kullan` / `use` or `içe_aktar` / `import`**.
16. **Type names are lowercase keywords** (e.g. `tamsayı`, `yazı`, `mantıksal`).
17. **Async functions use `asenkron` / `async`; awaiting uses `bekle` / `await`**.
18. **Error handling uses `dene`/`try` … `yakala`/`catch` … `son`/`end`**.
19. **The entry-point function is `ana` (Turkish) or `main` (English)**.
20. **Comments use `//` for single-line and `/* */` for multi-line**.
21. **BERK has TWO memory models, both valid:** (a) **Ownership + Borrowing** (Rust-inspired): `geçir`/`move`, `paylaş`/`share`, `değiştir`/`borrow_mut`; and (b) **Region-Based Memory**: `bölge`/`region` keyword — allocate objects into named memory regions, all region memory is freed at once when the region ends. Both models can be used in the same program.
22. **BERK-RTOS is a separate product.** When writing BERK language code, do NOT assume RTOS primitives are always available — they require `import rtos::{}`.
23. **`bırak` is a valid variable binding keyword** (used in RTOS/pattern contexts, equivalent to `let` / `değişken`).
24. **`statik` / `static` declares static (global) variables**, especially used in RTOS shared state.

---

## 3. Program Structure

```berk
// Turkish form
fonksiyon ana() -> tamsayı
yap
    yazdır("Merhaba, BERK!")
    dön 0
son

// English form
function main() -> integer
do
    print("Hello, BERK!")
    return 0
end

// Mixed form (valid)
function hesapla(sayı: tamsayı) -> tamsayı
yap
    eğer sayı > 0
        return sayı * 2
    değilse
        dön 0
    son
son
```

---

## 4. Complete Keyword Reference

> Source: `keywords.rs` — BERK Lexer keyword database.
> Format: **Turkish** → **English** | Description

### 4.1 Control Flow (`ControlFlow`)

| Turkish | English | Description |
|---|---|---|
| `eğer` | `if` | Conditional branching |
| `ise` | `then` | Condition result |
| `değilse` | `else` | Alternative branch |
| `veya_eğer` | `elif` | Chained condition |
| `iken` | `while` | Conditional loop |
| `her_biri` | `for` | Iterative loop |
| `içinde` | `in` | Iteration source |
| `seç` | `match` | Pattern matching |
| `durum` | `case` | Match case |
| `dur` | `break` | Break from loop |
| `geç` | `continue` | Continue to next iteration |
| `dön` | `return` | Return from function |
| `döndür` | `return` | Return from function (alt) |

### 4.2 Declarations (`Declaration`)

| Turkish | English | Description |
|---|---|---|
| `fonksiyon` | `function` | Define function |
| `fn` | `fn` | Function (short form) |
| `değişken` | `let` | Define variable |
| `bırak` | `let` | Variable binding (RTOS/pattern contexts) |
| `sabit` | `const` | Define constant |
| `statik` | `static` | Static / global variable |
| `yapı` | `struct` | Define structure |
| `numaralama` | `enum` | Enumeration |
| `özellik` | `trait` | Define trait |
| `uygula` | `impl` | Implementation |
| `tip` | `type` | Type alias |
| `modül` | `module` | Define module |
| `bölge` | `region` | Define memory region (Region-Based Memory) |
| `döngü` | `loop` | Infinite loop |

### 4.3 Types (`Type`)

| Turkish | English | Description |
|---|---|---|
| `tamsayı` | `integer` | Integer type |
| `ondalık` | `float` | Floating point type |
| `yazı` | `string` | String (text) type |
| `mantıksal` | `boolean` | Boolean type |
| `liste` | `list` | List type |
| `demet` | `tuple` | Tuple type |

### 4.4 Values (`Value`)

| Turkish | English | Description |
|---|---|---|
| `doğru` | `true` | Boolean true |
| `yanlış` | `false` | Boolean false |
| `boş` | `null` | Null value |
| `Bazı` | `Some` | Optional — value present |
| `Hiçbir` | `None` | Optional — no value |
| `Tamam` | `Ok` | Result — success |
| `Hata` | `Err` | Result — error |

### 4.5 Operators (`Operator`)

| Turkish | English | Description |
|---|---|---|
| `ve` | `and` | Logical AND |
| `veya` | `or` | Logical OR |
| `değil` | `not` | Logical NOT |
| `olarak` | `as` | Type cast |

### 4.6 Module System (`Module`)

| Turkish | English | Description |
|---|---|---|
| `kullan` | `use` | Import module |
| `içe_aktar` | `import` | Import |
| `dışa_aktar` | `export` | Export |
| `dan` | `from` | Specify source |
| `açık` | `pub` | Public visibility |

### 4.7 Memory Management (`Memory`)

BERK supports **two memory management models** that can be used in the same program:

**Model A — Ownership & Borrowing (Rust-inspired):**

| Turkish | English | Description |
|---|---|---|
| `yeni` | `new` | Create new object |
| `paylaş` | `share` | Immutable reference (shared borrow) |
| `değiştir` | `borrow_mut` | Mutable borrow |
| `geçir` | `move` | Transfer ownership (move semantics) |

**Model B — Region-Based Memory:**

| Turkish | English | Description |
|---|---|---|
| `bölge` | `region` | Define a named memory region |

Region-based memory allocates objects into a named region. When the region scope ends, **all memory in that region is freed at once** — no individual deallocation needed. This is especially useful for embedded/real-time contexts where predictable, deterministic memory lifetimes are required.

```berk
// Region-based allocation example
bölge istek_bölgesi
yap
    değişken tampon = yeni Tampon(256)  // allocated into region
    değişken veri   = yeni Veri()       // allocated into region
    işle(tampon, veri)
son
// All region memory freed here atomically
```

### 4.8 Error Handling (`Error`)

| Turkish | English | Description |
|---|---|---|
| `dene` | `try` | Try error handling |
| `yakala` | `catch` | Catch error |

### 4.9 Block Delimiters (`Other`)

| Turkish | English | Description |
|---|---|---|
| `yap` | `do` | Open block |
| `son` | `end` | Close block |

### 4.10 Async/Await (`Async`)

| Turkish | English | Description |
|---|---|---|
| `asenkron` | `async` | Async function |
| `bekle` | `await` | Await result |
| `başlat` | `spawn` | Spawn task |
| `seçim` | `select` | Select on futures |

### 4.11 DDS-RTPS Real-Time Pub/Sub (`Dds`)

#### Core Entities

| Turkish | English | Description |
|---|---|---|
| `katılımcı` | `participant` | DDS DomainParticipant |
| `konu` | `topic` | DDS Topic |
| `yayıncı` | `publisher` | DDS Publisher |
| `abone` | `subscriber` | DDS Subscriber |
| `yazıcı` | `writer` | DDS DataWriter |
| `okuyucu` | `reader` | DDS DataReader |

#### QoS Policies

| Turkish | English | Description |
|---|---|---|
| `güvenilir` | `reliable` | Reliable QoS |
| `elinden_gelen` | `best_effort` | BestEffort QoS |
| `geçmiş` | `history` | History QoS |
| `kalıcılık` | `durability` | Durability QoS |
| `süre_sınırı` | `deadline` | Deadline QoS |
| `ömür` | `lifespan` | Lifespan QoS |
| `geçici` | `volatile` | Volatile |
| `kalıcı` | `transient` | Transient |
| `sürekli` | `persistent` | Persistent |

#### DDS Operations

| Turkish | English | Description |
|---|---|---|
| `yayınla` | `publish` | Publish / Write |
| `al` | `receive` | Receive / Read |
| `çek` | `take` | Destructive read |
| `beklet` | `wait` | Wait for data |
| `alan` | `domain` | Domain ID |

### 4.12 HAL — Hardware Abstraction Layer (`Hal`)

#### Modules

| Turkish | English | Description |
|---|---|---|
| `donanım_soyutlama` | `hal` | Hardware Abstraction Layer |
| `giriş_çıkış` | `gpio` | General Purpose I/O |
| `seri_iletişim` | `uart` | UART Serial |
| `spi` | `spi` | SPI bus |
| `i2c` | `i2c` | I2C bus |
| `analog_dijital` | `adc` | Analog-to-Digital Converter |
| `dijital_analog` | `dac` | Digital-to-Analog Converter |
| `zamanlayıcı` | `timer` | Hardware timer |
| `darbe_genişlik` | `pwm` | Pulse Width Modulation |
| `doğrudan_bellek` | `dma` | Direct Memory Access |

#### Pin Configuration

| Turkish | English | Description |
|---|---|---|
| `çıkış_olarak` | `as_output` | Configure as output |
| `giriş_olarak` | `as_input` | Configure as input |
| `alternatif_olarak` | `as_alternate` | Alternate function |
| `yukarı_çek` | `pull_up` | Internal pull-up |
| `aşağı_çek` | `pull_down` | Internal pull-down |
| `açık_drenaj` | `open_drain` | Open drain |
| `itme_çek` | `push_pull` | Push-pull |

#### Pin Operations

| Turkish | English | Description |
|---|---|---|
| `yüksek_yap` | `set_high` | Set pin high |
| `alçak_yap` | `set_low` | Set pin low |
| `değiştir_pin` | `toggle` | Toggle pin |
| `yüksek_mi` | `is_high` | Is pin high? |
| `alçak_mı` | `is_low` | Is pin low? |

### 4.13 RTOS — Real-Time OS (`Rtos`)

#### Tasks & Scheduling

| Turkish | English | Description |
|---|---|---|
| `görev` | `task` | RTOS task |
| `öncelik` | `priority` | Task priority |
| `periyot` | `period` | Task period |
| `yığın` | `stack` | Stack size |
| `olay` | `on` | Event handler |
| `yayınla_olay` | `emit` | Emit event |
| `devret` | `yield` | Cooperative yield |

#### Synchronization

| Turkish | English | Description |
|---|---|---|
| `kilit` | `mutex` | Mutex lock |
| `semafor` | `semaphore` | Semaphore |
| `kanal` | `channel` | Communication channel |
| `kritik_bölge` | `critical_section` | Critical section |

#### MILS Partitioning

| Turkish | English | Description |
|---|---|---|
| `bölüm` | `partition` | MILS partition |
| `zaman_penceresi` | `time_window` | Time window |
| `maks_görev` | `max_tasks` | Maximum task count |
| `belirlenimci` | `deterministic` | Deterministic block |

#### Bounded Execution

| Turkish | English | Description |
|---|---|---|
| `sınırlı` | `bounded` | Bounded loop |
| `özyinelemeli` | `recursive` | Recursive function |
| `maks_derinlik` | `max_depth` | Maximum recursion depth |
| `kuyruk_çağrı` | `tail_call` | Tail call optimization |

### 4.14 Safety Annotations (`Safety`)

#### Type Constraints & Contracts

| Turkish | English | Description |
|---|---|---|
| `etkiler` | `effects` | Effect annotation |
| `nerede` | `where` | Type constraint |
| `Öz` | `Self` | Current type (self-reference) |
| `çıkarım_sözleşmesi` | `inference_contract` | AI inference contract |

#### Memory Regions

| Turkish | English | Description |
|---|---|---|
| `DmaTampon` | `DmaBuffer` | DMA-safe buffer |
| `FlashSabit` | `FlashConst` | Flash/ROM constant |
| `YığınYerel` | `StackLocal` | Stack-allocated |
| `StatikBellek` | `StaticMem` | Static memory |
| `PaylaşımlıBellek` | `SharedMem` | Shared memory |

#### Register / HAL Annotations

| Turkish | English | Description |
|---|---|---|
| `yazmaç` | `register` | Register annotation |
| `geçerli_bitler` | `valid_bits` | Valid bits annotation |
| `sıfırlama_değeri` | `reset_value` | Reset value |
| `bit_alanı` | `bitfield` | Bitfield |
| `çevre_birimi` | `peripheral` | Peripheral |
| `salt_okunur` | `read_only` | Read-only access |
| `salt_yazılır` | `write_only` | Write-only access |
| `oku_yaz` | `read_write` | Read-write access |
| `bir_kez_yaz` | `write_once` | Write-once access |

#### RTOS Ownership

| Turkish | English | Description |
|---|---|---|
| `korumalı` | `protected` | Protected resource |
| `sahipli` | `owned` | Owned resource |

#### Latency & Real-Time Annotations

| Turkish | English | Description |
|---|---|---|
| `maksimum_gecikme` | `max_latency` | Maximum latency |
| `yığın_yok` | `no_heap` | No heap allocation |
| `bloklama_yok` | `no_blocking` | No blocking calls |
| `yığın_limiti` | `stack_limit` | Stack usage limit |
| `keskin_gerçek_zaman` | `hard_realtime` | Hard real-time |
| `yumuşak_gerçek_zaman` | `soft_realtime` | Soft real-time |
| `kesme_önceliği` | `interrupt_priority` | Interrupt priority |
| `iç_içe_izin` | `allow_nesting` | Allow nested interrupts |

#### WCET (Worst-Case Execution Time)

| Turkish | English | Description |
|---|---|---|
| `ekz` | `wcet` | Worst-case execution time |
| `sapma` | `jitter` | Timing jitter |
| `güvenlik_payı` | `safety_margin` | Safety margin |
| `çalışma_kontrolü` | `runtime_check` | Runtime check |

### 4.15 Power Management (`Power`)

| Turkish | English | Description |
|---|---|---|
| `güç_modu` | `power_mode` | Power mode annotation |
| `güç_gerektirir` | `requires_power` | Power requirement |
| `uyku` | `sleep` | Sleep mode |
| `derin_uyku` | `deep_sleep` | Deep sleep |
| `bekleme` | `standby` | Standby mode |
| `çalışır` | `run` | Run mode |
| `düşük_güç` | `low_power` | Low power mode |
| `uyandırma_kaynağı` | `wake_source` | Wake source |

---

## 5. Syntax Patterns

### 5.1 Variable Declaration

```berk
değişken x: tamsayı = 42
değişken isim: yazı = "Ahmet"
değişken aktif: mantıksal = doğru
değişken sayılar: liste<tamsayı> = [1, 2, 3]
değişken nokta: demet<tamsayı, tamsayı> = (10, 20)
```

### 5.2 Function Definition

```berk
fonksiyon selamla(isim: yazı) -> yazı
yap
    dön "Merhaba, " + isim + "!"
son
```

### 5.3 Conditional

```berk
eğer x > 0
yap
    yazdır("Pozitif")
değilse eğer x < 0
yap
    yazdır("Negatif")
değilse
yap
    yazdır("Sıfır")
son
```

### 5.4 While Loop

```berk
değişken i: tamsayı = 0
iken i < 10
yap
    yazdır(i)
    i = i + 1
son
```

### 5.5 For-Each Loop

```berk
her_biri öğe içinde liste
yap
    yazdır(öğe)
son
```

### 5.6 Pattern Matching

```berk
seç durum mesaj
    durum "başarılı":
        yazdır("İşlem tamamlandı!")
    durum "hata":
        yazdır("Bir hata oluştu!")
    durum _:
        yazdır("Bilinmeyen durum")
son
```

### 5.7 Struct Definition

```berk
yapı Nokta
yap
    x: tamsayı
    y: tamsayı
son
```

### 5.8 Enum Definition

```berk
numaralama Yön
yap
    durum Kuzey
    durum Güney
    durum Doğu
    durum Batı
son
```

### 5.9 Error Handling

```berk
dene
    değişken dosya = aç("data.txt")
    yazdır(oku(dosya))
yakala hata
    yazdır("Dosya açılamadı: " + hata)
son
```

### 5.10 Async Function

```berk
asenkron fonksiyon veri_al() -> yazı
yap
    değişken yanıt = bekle http.al("https://api.örnek.com/veri")
    dön yanıt.metin()
son
```

### 5.11 Module Import

```berk
kullan linalg, stats, optim

// veya
içe_aktar matematik dan standart_kütüphane
```

### 5.12 Infinite Loop

```berk
// Turkish
döngü
yap
    yazdır("Çalışıyor...")
    bekle 1000ms
son

// English
loop
do
    print("Running...")
    wait 1000ms
end
```

### 5.13 RTOS Task Definition (with `{ }` brace syntax)

```berk
import rtos::{görev, Öncelik, Mutex, Kanal}

// RTOS task struct-style syntax uses { } braces
görev SensörOkuyucu {
    öncelik: Öncelik::YÜKSEK,
    periyot: 10ms,
    yığın: 2KB,
    son_tarih: 8ms,

    başla() {
        döngü {
            bırak veri = sensör_oku()
            veri_kanal.gönder(veri)
            rtos::bekle_periyot()
        }
    }
}
```

### 5.14 Static Shared State (RTOS pattern)

```berk
statik veri_mutex: Mutex<SensörVerisi> = Mutex::yeni(SensörVerisi {
    sıcaklık: 0.0,
    basınç: 0.0,
    zaman_damgası: 0,
})

statik veri_kanal: Kanal<SensörVerisi, 16> = Kanal::yeni()
```

### 5.15 Region-Based Memory

```berk
bölge istek_bölgesi
yap
    değişken tampon = yeni Tampon(256)
    değişken veri   = yeni Veri()
    işle(tampon, veri)
son
// Tüm bölge belleği burada serbest bırakılır

// English
region request_region
do
    let buffer = new Buffer(256)
    let data   = new Data()
    process(buffer, data)
end
// All region memory freed here
```

### 5.16 HAL GPIO Example

```berk
değişken led = giriş_çıkış.PC13 çıkış_olarak itme_çek

her_biri _ içinde 0..10
yap
    yüksek_yap(led)
    bekle 500ms
    alçak_yap(led)
    bekle 500ms
son
```

### 5.17 DDS Publisher Example

```berk
katılımcı dp = katılımcı.oluştur(alan: 0)
konu t = dp.konu_oluştur("SıcaklıkVerisi", tamsayı)
yayıncı yy = dp.yayıncı_oluştur()
yazıcı w = yy.yazıcı_oluştur(t) güvenilir

yayınla(w, 42)
```

---

## 6. Type System Quick Reference

| BERK Turkish | BERK English | Equivalent Concept |
|---|---|---|
| `tamsayı` | `integer` | 64-bit signed int |
| `ondalık` | `float` | 64-bit float |
| `yazı` | `string` | UTF-8 string |
| `mantıksal` | `boolean` | bool |
| `liste<T>` | `list<T>` | dynamic array |
| `demet<A,B>` | `tuple<A,B>` | tuple |
| `Bazı(T)` | `Some(T)` | Option — some |
| `Hiçbir` | `None` | Option — none |
| `Tamam(T)` | `Ok(T)` | Result — ok |
| `Hata(E)` | `Err(E)` | Result — error |

---

## 7. Common AI Mistakes to Avoid

| ❌ WRONG | ✅ CORRECT |
|---|---|
| `var x = 5` | `değişken x = 5` veya `bırak x = 5` |
| `func selamla()` | `fonksiyon selamla()` |
| `if x > 0 { }` | `eğer x > 0 yap ... son` |
| `else { }` | `değilse yap ... son` |
| `for i in list { }` | `her_biri i içinde liste yap ... son` |
| `while true { }` | `iken doğru yap ... son` |
| `while(1) { }` (infinite) | `döngü yap ... son` |
| `loop { }` only | `döngü yap ... son` (Turkish) |
| `match x { }` | `seç durum x ... son` |
| `None` (as keyword) | `Hiçbir` (Turkish) or `None` (English) |
| `true` only | `doğru` (Turkish) or `true` (English) |
| `null` only | `boş` (Turkish) or `null` (English) |
| `fn` only | `fonksiyon` / `function` / `fn` all valid |
| `try { } catch { }` | `dene yap ... son yakala hata yap ... son` |
| `async fn` | `asenkron fonksiyon` |
| `await x` | `bekle x` |
| `import x` | `kullan x` or `içe_aktar x` |
| `pub fn` | `açık fonksiyon` |
| Only Rust ownership model | BERK has **two** models: ownership/borrow AND region-based (`bölge`) |
| `let` only for variables | `değişken`, `let`, or `bırak` are all valid |
| `static` only | `statik` (Turkish) or `static` (English) |
| Assume RTOS is built-in | BERK-RTOS is a **separate product** — always `import rtos::{}` |
| Write `{ }` for all blocks | `yap/son` for function/control bodies; `{ }` for RTOS task/struct syntax |

---

## 8. Language Properties

- **Paradigm:** Multi-paradigm (imperative, functional, concurrent, safety-critical)
- **Memory model:** Dual — (1) Ownership + Borrowing (Rust-inspired, no GC) AND (2) Region-Based Memory (`bölge`/`region`)
- **Backend:** LLVM 17.0.6 (O0–O3 optimization, LTO)
- **Performance:** C/C++ parity (~98–100%)
- **Bilingual syntax:** Turkish ↔ English, same compiler, same AST; mixed-language files valid
- **Null safety:** `Bazı`/`Some` and `Hiçbir`/`None` option types
- **Error handling:** `Tamam`/`Ok` and `Hata`/`Err` result types
- **Compile targets:** 33 platforms (x86_64, i686, AArch64, ARM Thumb/Cortex-M, RISC-V, WASM, PowerPC, MIPS, SPARC, LoongArch, SystemZ)
- **Embedded targets:** ARM Cortex-M0/M3/M4/M7, RISC-V 32/64-bit, ESP32, AVR, Nordic nRF52/53
- **Desktop targets:** Windows x64/ARM, Linux x64/ARM/RISC-V, macOS Intel/Apple Silicon
- **Other targets:** WebAssembly (wasm32-unknown, wasm32-wasi), Android, iOS, Cloud (Lambda, Azure, GCP)
- **Standard library:** 120+ modules, 3000+ native functions, 3200+ FFI entries
- **HAL coverage:** 43 HAL modules, 5 embedded platforms (ESP32, STM32, RP2040, nRF52, Arduino/generic)
- **Domain libraries:** Avionics (DO-178C), Automotive ADAS (ISO 26262), Medical (IEC 62304), Railway (EN 50128), Space (ECSS), Robotics, Telecom (5G/TSN), Bioinformatics, Finance/Trading
- **Safety certifications targeted:** DO-178C DAL-A/B, IEC 62304 Class C, ISO 26262 ASIL-D, IEC 61508 SIL3, EN 50128 SIL4, ECSS-E-ST-40C, CC EAL5+/EAL7
- **Compile-time RTOS semantics:** scheduling, timing, and communication constraints verified at compile time (requires BERK-RTOS product)
- **Project scale:** ~350,000+ lines of Rust source code, 218+ files, 600+ tests

---

## 9. Compiler & VS Code CLI

```sh
# Compile to native binary
berk-lang build main.berk -o main.exe

# Run directly (JIT)
BERK-lang run program.berk

# Interactive REPL
BERK-lang repl

# Emit LLVM IR
berk-lang build main.berk --emit-llvm

# Emit Assembly
berk-lang build main.berk --emit-asm

# Cross-compile targets
berk-lang build main.berk --target aarch64-linux-gnu       # ARM64 Linux
berk-lang build main.berk --target thumbv7em-none-eabihf   # ARM Cortex-M4 (embedded)
berk-lang build main.berk --target thumbv6m-none-eabi      # ARM Cortex-M0
berk-lang build main.berk --target riscv32-none-elf        # RISC-V 32-bit embedded
berk-lang build main.berk --target wasm32-wasi             # WebAssembly
berk-lang build main.berk --target x86_64-windows-msvc    # Windows from Linux

# Optimize
berk-lang build main.berk --target ... # set berk.llvm.optimizationLevel in VS Code settings
```

**VS Code Shortcuts:**

| Shortcut | Action |
|---|---|
| `Ctrl+Shift+B` | Run current file |
| `Ctrl+Shift+N` | Compile to native executable |
| `Ctrl+Shift+F` | Format document |
| `Ctrl+Shift+T` | Run all tests |
| `Ctrl+Shift+L` | Lint current file |
| `F5` | Start debugger |

---

## 10. Domain-Specific Standard Libraries

BERK's stdlib includes certified domain libraries. Each has its own import path:

| Domain | Import Path | Standard | Key Modules |
|---|---|---|---|
| Avionics | `import avionics::{}` | DO-178C DAL-A/B | `arinc429`, `arinc664`, `mil1553`, `do178c` |
| Automotive ADAS | `import adas::{}` | ISO 26262 ASIL-D | `perception`, `planning`, `control`, `v2x`, `safety` |
| Medical | `import medical::{}` | IEC 62304 Class C | `iec62304`, `risk`, `audit` |
| Railway | `import railway::{}` | EN 50128 SIL4 | `etcs`, `interlocking`, `signaling`, `en50128` |
| Space | `import space::{}` | ECSS-E-ST-40C | `ccsds`, `ecss`, `fdir`, `mission` |
| Robotics | `import robotics::{}` | ISO 10218 | `arm`, `drone`, `px4`, `navigation`, `swarm` |
| Telecom | `import telecom::{}` | 3GPP / IEC 62443 | `tsn`, `ptp`, `sdr`, `oran`, `frame_buffer` |
| Bioinformatics | `import bio::{}` | — | `sequence`, `fasta`, `alignment`, `protein`, `crispr` |
| Finance | `import finance::{}` | — | `market_data`, `order_book`, `risk`, `derivatives` |
| RTOS | `import rtos::{}` | — | `görev`/`task`, `kilit`/`mutex`, `kanal`/`channel` |

**Safety annotation attributes** (used as `#[...]` decorators on functions/tasks):

```berk
#[requirement("REQ-NAV-001")]   // DO-178C traceability
#[dal(DalLevel::A)]             // DO-178C level
#[asil(AsilLevel::D)]           // ISO 26262 ASIL
#[sil(SilLevel::SIL4)]          // IEC 61508 / EN 50128
#[software_class(IEC62304::ClassC)]  // Medical IEC 62304
#[risk_control("RC-001")]       // Risk control reference
#[fdir_monitored]               // Space FDIR monitoring
```

---

## 11. BERK vs BERK-RTOS — Critical Distinction

```
┌─────────────────────────────────────────────────────────────────────┐
│  BERK Language                   BERK-RTOS                          │
│  ─────────────                   ──────────                         │
│  Systems programming language    Separate RTOS product              │
│  This document covers this ✓     Powered BY BERK language           │
│                                  NOT covered by this document        │
│                                                                     │
│  Works bare-metal                Adds real-time kernel              │
│  Works on FreeRTOS/Zephyr        Replaces how RTOS apps are         │
│  No RTOS dependency              expressed and verified             │
└─────────────────────────────────────────────────────────────────────┘
```

When an AI model writes BERK code:
- **General BERK code** → use `yap/son` blocks, `değişken`, `fonksiyon`, etc.
- **BERK-RTOS code** → always prefix with `import rtos::{}`, use `görev`/`task` struct syntax with `{ }` braces, `Öncelik`/`Priority`, `Mutex`, `Kanal`/`Channel`

---

*This file is the authoritative AI reference for the BERK programming language. Keywords are sourced directly from the BERK compiler's `keywords.rs` lexer. Memory model, ecosystem, and stdlib data are sourced from the official VS Code extension page and documentation. Do not modify keyword spellings or invent new tokens.*