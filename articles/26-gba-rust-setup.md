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

C has the longest history on the GBA, and [article 14](14-making-games.md) lists its tools. The [gbadev guide](https://gbadev.net/getting-started.html) says the GBA does not support languages like C#, Python, or Java, and lists Nim and Rust options. This series uses Rust with agb because its types make the hardware rules easy to see.

## Tools

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

## What has not been tested

Nothing was run on a real GBA. The setup was tried only on one Mac.

## Check your understanding

**Why can't a GBA program use `println!`?**

`println!` belongs to the standard library, which assumes an OS. The GBA has none, so the program uses `#![no_std]`, and `agb::println!` writes to mGBA's log instead.

**Why does `main` have the return type `!`?**

A game keeps running until the power goes off, so the function never returns.

**Why write a date in `rust-toolchain.toml`?**

Nightly compilers change. Here, the newest one could not build agb 0.25.0, and the one from its release date could.

## What you can learn

A GBA game in Rust needs no separate ARM compiler, but it does depend on a nightly compiler, so pinning its date matters. Without an OS, `std` goes away, and agb supplies the entry point, an allocator, and a way to print to the emulator's log.
