# gaming

This repository uses Chinese-made handheld game consoles as teaching material for learning about computers and games, software and hardware, and for studying Chinese along the way. Research that began as a purchase decision has been reorganized into articles that can be read in order.

Each claim is followed immediately by a link to its source. Official documents, specification databases, personal articles, and forum posts differ in reliability, in that order, so the types of sources are described in the [source notes](sources/README.md). Figures and quotations in the articles are limited to those confirmed on pages that were actually opened. Anything that could not be confirmed is stated as unconfirmed in the text.

## Articles

The reading order is: overview, devices, OS, installation, frontends, compatibility, modding, Pokémon, buying, communities, Chinese, ROMs and BIOS, preparing your own data, and making your own games. Articles 15 to 20 are a series that traces how computers work using the RG40XXH as teaching material, and article 21 applies that material.

1. [Overview of Chinese handhelds](articles/01-overview.md) covers brands and nicknames, differences between SoCs, and price ranges.
2. [Differences between the main devices](articles/02-devices.md) compares the RG40XXH, RG406V, RG556, Retroid Pocket 4 Pro, 5, and Nova.
3. [OS options](articles/03-os.md) explains the differences between Android and Linux and sorts out ROCKNIX, Knulli, muOS, and others.
4. [Installing CFW](articles/04-install-cfw.md) gives the installation steps for ROCKNIX and Knulli.
5. [Frontends and Tianma G](articles/05-frontend-tianma-g.md) explains Pegasus metadata and the structure of Tianma G.
6. [What runs](articles/06-emulation.md) sorts out compatibility by device.
7. [What you can modify](articles/07-mods.md) covers everything from software settings to cooling mods.
8. [Pokémon ROM hacks](articles/08-pokemon-hacking.md) introduces how they are made, the tools, and the Chinese-speaking community.
9. [How to buy Chinese devices](articles/09-buying.md) covers official sales channels and proxy buying services.
10. [Communities and information sources](articles/10-communities.md)
11. [How to study Chinese](articles/11-chinese.md)
12. [Handling ROMs and BIOS](articles/12-roms-and-bios.md) sorts out where to place files, how to verify them, and how to think about rights.
13. [Preparing your own data and rights-free games](articles/13-own-data-and-free-games.md) covers dumping hardware and prices, homebrew, replacement BIOS, and open source tools.
14. [How to make your own games](articles/14-making-games.md) sorts out GB Studio, GBDK, GBA tools, and porting with PortMaster.
15. [The big picture of the RG40XXH](articles/15-rg40xxh-big-picture.md) covers the three layers of hardware, OS, and apps, as well as files and the contents of the SD card.
16. [Emulators and menus](articles/16-emulator-and-menu.md) follows, through ROCKNIX configuration files, how a menu finds a game and hands it to an emulator.
17. [How saves work](articles/17-save-data.md) covers cartridge save memory, `.srm` files, save states, and what is inside a save.
18. [How the OS works](articles/18-os.md) covers the systemd setup that launches the menu, the split between the read-only OS and `/storage`, and how writes are buffered.
19. [After you turn on the power](articles/19-boot.md) covers the boot order from BootROM to kernel, the hidden areas of the SD card, and DTBs.
20. [CPUs and machine code](articles/20-cpu.md) reads what instructions contain, the differences between ELF and Mach-O, how emulators interpret code, and the instructions that determine your first Pokémon.
21. [Cheats and passthrough](articles/21-cheats-and-passthrough.md) examines, using the Emerald and RetroArch source code, cheats that read and write the memory of a running game and mods that connect two games through passthrough.
22. [Trying reverse engineering with REA](articles/22-rea-hands-on.md) uses REA to take apart an SD card image, record and compare behavior, and compare .NET and JavaScript versions.
23. [Reading machine code with REA and Ghidra](articles/23-rea-and-ghidra.md) traces functions from strings, recovers pseudocode, and goes as far as rewriting a single byte.
24. [Learning Android with the Nova](articles/24-android-nova.md) sets out a study plan for taking apart and reading Android APKs and comparing them with Linux on the RG40XXH.
25. [Turning an original Switch into your own homebrew development device](articles/25-switch-cfw.md) sorts out, with sources, how to identify the fusée gelée vulnerability, RCM jigs and payload injection, emuMMC, homebrew app development, and mods for existing games.

Code for minimal working games is in [examples](examples/README.md).

The Chinese materials are the [vocabulary list](chinese/vocabulary.md), the [slang glossary](chinese/slang.md), and the [search keywords](chinese/search-keywords.md). Summaries of the cited sources are in [sources](sources/README.md). There is no separate list of links; follow them from the body of each article.

## Images

The images in the articles are screenshots stored in `assets/screenshots` and links to images published by the ROCKNIX, Porymap, and Pegasus repositories. The screenshots were taken of pages opened during research and are kept for learning purposes.

## Copyright

Game ROMs and BIOS files, and packs that bundle large numbers of them, are often problematic from a rights standpoint. This repository does not record where to obtain ROMs or BIOS files, distribution links, or download steps. It is written on the premise of learning how things work and using data you have legitimately prepared yourself.
