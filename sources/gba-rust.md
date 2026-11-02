# GBA hardware and Rust sources

These are the sources for articles 26 to 31. They were checked on November 2, 2026.

## GBATEK

[GBATEK](https://problemkaputt.de/gbatek.htm) is a technical reference for the GBA and DS. Reliability is aggregated (a community reference, not from the manufacturer). It was used for the memory map, `KEYINPUT`, the cartridge header, tile sizes, OAM, and display timing. Its timing section gives "ca. 59.737 Hz", while 16,777,216 ÷ 280,896 and [Tonc](https://www.coranac.com/tonc/text/video.htm) give about 59.73, so the articles use 59.73.

## Tonc

[Tonc](https://www.coranac.com/tonc/text/video.htm) is a GBA programming tutorial, which the [gbadev guide](https://gbadev.net/getting-started.html) calls the best one currently available. Reliability is personal. It was used for the screen, tiled modes, OAM, and VBlank.

## agb

[agb](https://github.com/agbrs/agb) is the Rust library used in the series, read at tag `v0.25.0`, and the [agb book](https://agbrs.dev/book/) is its guide. [agbrs/template](https://github.com/agbrs/template) was used at commit `99ee807`. Reliability is official. It was used for startup code, the linker layout, input, text rendering, the allocator, and setup.

## mGBA

[mGBA](https://github.com/mgba-emu/mgba) is the emulator, read at tag `0.10.5`. Reliability is official. It was used for ELF loading, BIOS skipping, and its debugging tools.

## Rust documentation

The [rustc book](https://doc.rust-lang.org/rustc/platform-support/armv4t-none-eabi.html) was used for the target's tier and the Thumb-1 note, and the [rustc dev guide](https://rustc-dev-guide.rust-lang.org/backend/codegen.html) for LLVM and codegen units. Reliability is official.

## Viewers

[Ghidra](https://github.com/NationalSecurityAgency/ghidra), [Hex Fiend](https://hexfiend.com/), and [YY-CHR](https://www.romhacking.net/utilities/119/) were checked only by reading their pages. They were not run on these files.
