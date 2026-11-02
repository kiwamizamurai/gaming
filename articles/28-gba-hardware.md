# CPU, memory, and registers on the GBA

Continuing from [article 27](27-gba-counter-logic.md), this article looks under agb and reads a button without it.

## The CPU

The GBA's CPU is an ARM7TDMI running at 16.78MHz, according to [GBATEK](https://problemkaputt.de/gbatek.htm). It has two instruction sets: ARM with 32-bit instructions and Thumb, which is mainly 16-bit. [Article 20](20-cpu.md) read Thumb instructions from a Pokémon build. The project's target, `thumbv4t-none-eabi`, asks for Thumb.

The log in [article 31](31-gba-startup-and-memory.md) shows this: `Counter::increment` has the address `0x800018d`. It is odd because, on ARM, the lowest bit of a function's address marks it as Thumb code.

## One address space

The CPU sees everything as addresses. These are from GBATEK, and EWRAM, IWRAM, and ROM also appear in the [linker file](https://github.com/agbrs/agb/blob/v0.25.0/agb/src/gba.ld).

| Start | What | Size |
|---|---|---|
| `0x00000000` | BIOS | 16KB |
| `0x02000000` | EWRAM (on-board work RAM) | 256KB |
| `0x03000000` | IWRAM (on-chip work RAM) | 32KB |
| `0x04000000` | I/O registers | |
| `0x05000000` | Palette RAM | 1KB |
| `0x06000000` | VRAM | 96KB |
| `0x07000000` | OAM | 1KB |
| `0x08000000` | Cartridge ROM | Up to 32MB |

`agb`'s linker file gives IWRAM 256 bytes less than 32KB, with the comment that the BIOS reserves the final 256 bytes.

## Hardware that looks like memory

The address `0x04000130` is not memory. It is `KEYINPUT`, the register holding the button state. Reading it reads the buttons. This is called memory-mapped I/O. agb's `input.rs` has the same address: `const BUTTON_INPUT: *mut u16 = (0x04000130) as *mut u16;`.

The counter reads it directly when the value changes.

```rust
const KEYINPUT: *const u16 = 0x0400_0130 as *const u16;

let keys = unsafe { core::ptr::read_volatile(KEYINPUT) };
```

`unsafe` is needed because Rust cannot check that this address is valid. `read_volatile` tells the compiler to really read each time, because the value can change without the program writing to it.

## Pressed means 0

Here is the log again.

```
counter = 3 KEYINPUT = 0b1111111110   (A held)
counter = 2 KEYINPUT = 0b1111111101   (B held)
```

All 10 button bits are 1 except the one being pressed. A is the lowest bit and B is the next. A pressed button reads as 0, which is the opposite of what you might expect.

## What has not been tested

The other 8 button bits were not checked one by one. Writing to registers directly was not tried in this series.

## What you can learn

To the CPU, RAM, ROM, and hardware are all addresses. A button is a bit at a fixed address, and `buttons.update()` hides that. Reading it yourself needs `unsafe` and a volatile read.
