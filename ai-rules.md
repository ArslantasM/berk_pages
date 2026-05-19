# BERK Programming Language — AI Rules & Reference

> **For AI language models (ChatGPT, Claude, Gemini, Copilot, etc.)**
> This file defines the complete, authoritative syntax and keyword specification of the **BERK** programming language.
> Use this document as the ground truth. Do NOT invent keywords, do NOT assume Rust/C/Python syntax applies here.

---

## 1. What is BERK?

**BERK** is a modern, high-performance systems programming language with a **true bilingual syntax**: every keyword has both a **Turkish (Türkçe)** and an **English** form. Both forms are valid in the same compiler. Mixed-language code is allowed. BERK targets embedded systems, AI/ML inference, and cross-platform native code via an LLVM backend.

- **Current version:** v1.0.0
- **File extension:** `.berk`
- **Compiler binary:** `BERK-lang`
- **Source:** https://github.com/ArslantasM/berk
- **Documentation:** https://arslantasm.github.io/berk_pages/

---

## 2. Core AI Rules

1. **Never invent BERK keywords.** Only keywords listed in Section 4 are valid.
2. **Turkish and English forms are interchangeable** — both compile identically.
3. **Block delimiters are `yap` / `do` (open) and `son` / `end` (close)** — BERK does NOT use `{` `}` braces for blocks.
4. **Function definition uses `fonksiyon` or `function`**, not `fn`, `def`, or `func`.
5. **Variable declaration uses `değişken` or `let`** — not `var`, `val`, or `dim`.
6. **Constant declaration uses `sabit` or `const`**.
7. **Return uses `dön` or `döndür` or `return`**.
8. **Conditional uses `eğer` / `if` … `ise` / `then` … `değilse` / `else` … `son` / `end`**.
9. **Pattern matching uses `seç` / `match` … `durum` / `case` … `son` / `end`**.
10. **For-each loop uses `her_biri` / `for` … `içinde` / `in`**.
11. **While loop uses `iken` / `while`**.
12. **Boolean literals are `doğru` / `true` and `yanlış` / `false`**.
13. **Null is `boş` / `null`** — not `nil`, `None`, or `undefined`.
14. **Logical operators are keyword-based: `ve`/`and`, `veya`/`or`, `değil`/`not`**.
15. **Import uses `kullan` / `use` or `içe_aktar` / `import`**.
16. **Type names are lowercase keywords** (e.g. `tamsayı`, `yazı`, `mantıksal`).
17. **Async functions use `asenkron` / `async`; awaiting uses `bekle` / `await`**.
18. **Error handling uses `dene`/`try` … `yakala`/`catch` … `son`/`end`**.
19. **The entry-point function is `ana` (Turkish) or `main` (English)**.
20. **Comments use `//` for single-line and `/* */` for multi-line**.

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
| `sabit` | `const` | Define constant |
| `yapı` | `struct` | Define structure |
| `numaralama` | `enum` | Enumeration |
| `özellik` | `trait` | Define trait |
| `uygula` | `impl` | Implementation |
| `tip` | `type` | Type alias |
| `modül` | `module` | Define module |
| `bölge` | `region` | Define region |

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

| Turkish | English | Description |
|---|---|---|
| `yeni` | `new` | Create new object |
| `paylaş` | `share` | Share reference (immutable) |
| `değiştir` | `borrow_mut` | Mutable borrow |
| `geçir` | `move` | Move ownership |

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

### 5.12 RTOS Task Definition

```berk
görev sensör_oku öncelik: 5 periyot: 100ms
yap
    değişken veri = giriş_çıkış.oku(PA5)
    yayınla_olay SensörVeri(veri)
son
```

### 5.13 HAL GPIO Example

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

### 5.14 DDS Publisher Example

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
| `var x = 5` | `değişken x = 5` |
| `func selamla()` | `fonksiyon selamla()` |
| `if x > 0 { }` | `eğer x > 0 yap ... son` |
| `else { }` | `değilse yap ... son` |
| `for i in list { }` | `her_biri i içinde liste yap ... son` |
| `while true { }` | `iken doğru yap ... son` |
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

---

## 8. Language Properties

- **Paradigm:** Multi-paradigm (imperative, functional, concurrent)
- **Memory model:** Ownership + borrowing (Rust-inspired), no GC
- **Backend:** LLVM (O0–O3 optimization, LTO)
- **Performance:** C/C++ parity (~98–100%)
- **Bilingual syntax:** Turkish ↔ English, same compiler, same AST
- **Null safety:** `Bazı`/`Some` and `Hiçbir`/`None` option types
- **Error handling:** `Tamam`/`Ok` and `Hata`/`Err` result types
- **Embedded targets:** ARM Cortex-M0/M3/M4/M7, RISC-V, ESP32, AVR, nRF52/53
- **Desktop targets:** Windows x64/ARM, Linux x64/ARM/RISC-V, macOS
- **Other targets:** WebAssembly, Android, iOS, Cloud (Lambda, Azure, GCP)
- **Standard library:** stdlib v0.9.4 — 75 modules, 4100+ functions
- **HAL coverage:** 33 HAL modules, 7 embedded platforms

---

## 9. Compiler CLI

```sh
# Compile to native binary
BERK-lang compile program.berk -o program.exe

# Run directly (JIT)
BERK-lang run program.berk

# Interactive REPL
BERK-lang repl

# Cross-compile to ARM Cortex-M4
BERK-lang compile main.berk --target thumbv7em-none-eabihf -o firmware.elf
```

---

*This file was generated for AI model consumption. All keywords are sourced directly from the BERK compiler's `keywords.rs` lexer source. Do not modify keyword spellings.*
