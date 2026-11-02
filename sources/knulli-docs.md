# Knulli Official Documentation

The type is the source of the documentation for the custom firmware Knulli. The URL is https://github.com/knulli-cfw/knulli.org . The public site https://knulli.org could not be read by the browser used in this research, so the GitHub source was read with the `gh` command. Reliability is official. The project itself is at https://github.com/knulli-cfw/knulli-linux , and the README of the old repository points to the new repository.

## Project description

[About Knulli](https://github.com/knulli-cfw/knulli.org/blob/main/docs/about-knulli.md) describes Knulli as custom firmware forked from Batocera. It is tailored to handhelds that are not compatible with the standard Linux kernel and to devices needing special support. Its distinguishing feature is that emulator settings are made in EmulationStation, per system or per game, rather than in each emulator's own interface. It recommends not using the RetroArch interface. The method for those who need it is to use override and remap files per system or per game. The folder structure is strict and case-sensitive.

The built-in features are emulators and ports (including PortMaster), support for the native version of PICO-8, fetching information from ScreenScraper, TheGamesDB, and ArcadeDB, RetroAchievements, Bluetooth, HDMI output, adding files wirelessly over SMB, screen frames (bezels), themes, dynamic and handmade collections, Syncthing, RGB LEDs, SSH, and behavior when the lid is closed on clamshell devices.

## Installation

The [Quick Start Guide](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/quick-start.md) explains, in order, per-device preparation, writing the image, setting the storage location, Wi-Fi, adding games and BIOS files, installing PortMaster, scraping, and RetroAchievements. Retroid's Pocket 5, Flip 2, Mini, and Mini V2 and Miyoo's Flip need preparation before writing.

The [installation](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/install.md) page describes the flow of getting the image for the device, extracting it with 7zip if it is split into multiple parts, writing it to an SD card, inserting it into the device, and booting. If Windows recommends initializing partitions it cannot read after writing, you must not do so.

The [partitioning explanation](https://github.com/knulli-cfw/knulli.org/blob/main/docs/guides/partitioning.md) says that an SD card after writing has six sections: about 36MB of unallocated space, 20MB and 16MB areas for Linux, a 4GB FAT32 `BATOCERA`, a 512MB `SHARE`, and the remaining free space. `SHARE` expands to the maximum on first boot and is initialized as exFAT. Before the Knulli Gladiator release, it was initialized as ext4.

## Device pages

The [supported device list](https://github.com/knulli-cfw/knulli.org/blob/main/docs/devices/index.md) includes Anbernic (RG Arc S, RG28XX, RG34XX, RG35XX Plus, 2024, H, SP, RG40XX H/V, RGCubeXX), GoRetroid (Retroid Pocket 5, Mini), Miyoo (Flip), Powkiddy (RGB30, X55), and TrimUI (Brick, Smart Pro).

The [RG40XX H](https://github.com/knulli-cfw/knulli.org/blob/main/docs/devices/anbernic/rg40xx-h.md) has an Allwinner H700, the Allwinner BSP 4.9.170 kernel, and a Mali G31 GPU. Its features are Wi-Fi, Bluetooth, suspend (short press of the power button), HDMI, and compatible USB Wi-Fi dongles. The [Retroid Pocket 5](https://github.com/knulli-cfw/knulli.org/blob/main/docs/devices/goretroid/retroid-pocket-5.md) page describes the steps for booting from an SD card.

The [BIOS explanation](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/bioses.md) says that BIOS files are copyrighted, so they are not included with Knulli. The needed BIOS files are checked with "Missing BIOS check" in the game settings.
