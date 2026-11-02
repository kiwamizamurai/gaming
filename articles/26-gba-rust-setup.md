# A GBA counter in Rust: setup and the smallest program

This series builds a counter for the Game Boy Advance in Rust and uses it to read the machine underneath. A adds 1, B subtracts 1, and START resets to 0. Everything was run on an Apple Silicon Mac with mGBA 0.10.5 and [agb](https://github.com/agbrs/agb) 0.25.0. Nothing was tried on a real GBA. The finished code is in [examples/agb-counter](../examples/agb-counter).

| No. | Article | What it covers |
|---|---|---|
| 26 | Setup and the smallest program (this article) | Tools, `no_std`, `#[agb::entry]` |
| 27 | [Counter logic and tests](27-gba-counter-logic.md) | `Counter`, buttons, the game loop, tests |
| 28 | [CPU, memory, and registers](28-gba-hardware.md) | ARM7TDMI, the memory map, reading a button directly |
| 29 | [Drawing on the screen](29-gba-graphics.md) | Tiles, backgrounds, sprites, palettes, VBlank |
| 30 | [From Rust code to a GBA ROM](30-rust-to-gba-rom.md) | Cross compilation, the linker, ELF, `.gba` |
| 31 | [Startup and where things live](31-gba-startup-and-memory.md) | BIOS, startup code, stack, BSS, heap |

## Can it be something other than C?

Yes. [Article 14](14-making-games.md) lists the C tools. The [gbadev guide](https://gbadev.net/getting-started.html) says the GBA does not support languages like C#, Python, or Java, and lists Lua through BPCore-Engine, Nim through Natu, and Rust through agb. Rust support is real but not first class: the [rustc book](https://doc.rust-lang.org/rustc/platform-support/armv4t-none-eabi.html) lists `thumbv4t-none-eabi` as Tier 3, with `core` and `alloc` only, and says it can be used on the GBA. This series uses Rust with agb.

## What do you need?

The [agb book's Mac guide](https://agbrs.dev/book/setup/mac.html) asks for rustup, git, and mGBA. You do not install a separate ARM compiler: this series never used `arm-none-eabi-gcc`, and it is not on the machine used here.

```sh
brew install --cask mgba-app
git clone --depth 1 https://github.com/agbrs/template my-game
```

The template's `.cargo/config.toml` runs the game with `mgba-qt`, which was not on the `PATH`. The guide's approach is to add `/Applications/mGBA.app/Contents/MacOS` to the `PATH`. This series calls the program by its full path instead.

If a version manager such as mise puts a broken `rustup` first, put `~/.cargo/bin` first. That happened here:

```
mise ERROR No version is set for shim: rustup
```

### Pin the nightly compiler

agb needs nightly Rust. The template's `channel = "nightly"` failed on November 2, 2026, with an error inside `agb_hashmap`, as shown in [article 30](30-rust-to-gba-rom.md). Using the nightly from agb 0.25.0's release date fixed it, so the example pins it.

```toml
[toolchain]
channel = "nightly-2026-07-22"
components = ["rust-src", "clippy", "rustfmt", "llvm-tools"]
```

## What is the smallest program?

This is the template's program, without its comments and test settings.

```rust
#![no_std]
#![no_main]

extern crate alloc;

#[agb::entry]
fn main(gba: agb::Gba) -> ! {
    agb::no_game(gba);
}
```

| Line | Meaning |
|---|---|
| `#![no_std]` | Do not use Rust's standard library, which assumes an operating system. The template's comment gives the reason: the GBA has none |
| `#![no_main]` | The compiler should not set up the usual `main`. The comment says agb defines its own |
| `extern crate alloc` | Allow `Vec` and `String`, using agb's allocator |
| `#[agb::entry]` | Mark this function as where the game starts |
| `gba: agb::Gba` | The handle to the hardware features |
| `-> !` | This function never returns |

`println!` is not available without `std`. `agb::println!` sends text to mGBA's log instead, which this series uses for checking. To see it, start mGBA with logging on.

```sh
/Applications/mGBA.app/Contents/MacOS/mGBA -C logToStdout=1 -C logLevel.gba.debug=127 <game>
```

Building and running this gives agb's built-in `no_game` screen. mGBA's screenshot key (F12) saved this picture.

![The agb no_game screen, with coloured squares spelling NO GAME](../assets/screenshots/agb-template-no-game.png)

## What has not been tested

Nothing was run on a real GBA. The setup was tried only on one Mac.

## Chinese terms in this article

The Chinese terms here were selected for their relevance to this article's topic from words whose sources were confirmed in other articles in this repository.

| Chinese | Pinyin | Meaning | Source |
|---|---|---|---|
| 模拟器 | mónǐqì | Emulator | [模拟器游戏 篇四](https://zhuanlan.zhihu.com/p/703325151) |
| 开源 | kāiyuán | Open source | [开源掌机吧](https://tieba.baidu.com/f?kw=%E5%BC%80%E6%BA%90%E6%8E%8C%E6%9C%BA) |
| 配置 | pèizhì | Settings | [天马G前端的使用](https://blog.csdn.net/fanged/article/details/152960565) |

## What you can learn

A GBA game in Rust needs no separate ARM compiler, but it does depend on a nightly compiler, so pinning its date matters. Without an OS, `std` goes away, and agb supplies the entry point, an allocator, and a way to print to the emulator's log.
