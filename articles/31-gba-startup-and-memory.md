# Startup and where things live

Continuing from [article 30](30-rust-to-gba-rom.md), this article follows what runs before `main` and measures where the counter's values end up.

## What runs before main

The CPU does not know the name `main`. [GBATEK](https://problemkaputt.de/gbatek.htm) lists the BIOS at `0x00000000` and the cartridge at `0x08000000`, and the header entry point is what the game supplies. [Article 19](19-boot.md) followed the same idea on the RG40XXH. The ELF's start address is `0x08000000`, and the first instruction jumps past the header.

mGBA's source also has a `GBASkipBIOS` function ([gba.c](https://github.com/mgba-emu/mgba/blob/master/src/gba/gba.c)), so an emulator run may not go through the BIOS. Which path these runs took was not checked.

## agb's startup code

[entrypoint.s](https://github.com/agbrs/agb/blob/v0.25.0/agb/src/entrypoint.s) is short and written in ARM assembly.

| Step | What it does |
|---|---|
| `b .Initialise` | Jump over the header |
| `str r0, [r1]` with `0x03007FFC` | Set the interrupt handler |
| `swi 0x000B0000` | Ask the BIOS (`CpuSet`) to copy `.ewram` from ROM to RAM |
| `bss_loop` | Fill `.bss` with zeros |
| `CommonInit` | Set the cartridge wait states, and continue |

This explains the table in [article 30](30-rust-to-gba-rom.md), where `.ewram` is stored in ROM but runs at `0x02000000`. The disassembly of the build shows the same loop.

```
080000e8 <bss_loop>:
 80000e8: e1500001     	cmp	r0, r1
 80000ec: b4802004     	strlt	r2, [r0], #4
 80000f0: bafffffc     	blt	0x80000e8 <bss_loop>
```

A comment in the source says this zero fill is not needed on real hardware or most emulators, because the BIOS clears RAM, but one flash cart's quick boot does not.

The part after `CommonInit` up to your `main` was not traced in this article.

## Measuring where values live

The counter prints the address of each kind of value.

```rust
static STEP: i32 = 1;
static mut PRESSES: u32 = 7;
static mut ZEROED: u32 = 0;

let local = 0u32;
let mut heap: Vec<u32> = Vec::new();
heap.push(1);
```

```
STEP     0x802ef88 = 1
PRESSES  0x2000000 = 7
ZEROED   0x2000194 = 0
local    0x3007eb4
Vec item 0x2000230
counter step fn 0x800018d
```

| Value | Address | Area | Why |
|---|---|---|---|
| `STEP` | `0x802ef88` | ROM | It never changes, so it can stay in ROM |
| `PRESSES` | `0x2000000` | EWRAM | It can change and starts at 7, so it is copied from ROM |
| `ZEROED` | `0x2000194` | EWRAM (`.bss`) | It starts at 0, so only the zero fill is needed |
| `local` | `0x3007eb4` | IWRAM | A local variable on the stack |
| `Vec` item | `0x2000230` | EWRAM | The heap |
| `Counter::increment` | `0x800018d` | ROM | Code. The odd address marks Thumb |

agb's [allocator source](https://github.com/agbrs/agb/blob/v0.25.0/agb/src/agb_alloc/mod.rs) confirms the heap: its global allocator ends at `EWRAM_END`, and its comment calls EWRAM the most plentiful RAM but slow to access. A separate allocator exists for IWRAM.

Addresses change between builds. `STEP` was `0x800a714` in an earlier version of this program.

## Stack and heap

The stack holds local variables and return addresses for function calls, and shrinks again when a function returns. The heap holds things whose size is decided while running, such as a `Vec`. On the GBA both are small: 32KB of IWRAM and 256KB of EWRAM, shared with everything else in those areas.

## What has not been tested

The stack's start value and how CPU modes use it were not checked. How much memory the counter uses in total was not measured.

## What you can learn

Before `main`, a short piece of startup code copies initial values from ROM to RAM and clears the zero area. Printing addresses shows the plan the linker made: constants and code in ROM, variables and the heap in EWRAM, and the stack in IWRAM.
