# Switch community sites and guides

This note collects the community guides, forums, and news articles among the sources of [article 25](../articles/25-switch-cfw.md). All were checked on October 15, 2026. Web pages were opened and read with Claude in Chrome (Chrome for macOS). GitHub repositories were read in the original through shallow clones.

## Switch Guide (nh-server/switch-guide)

The type is the source of an installation guide run by Nintendo Homebrew. The URL is https://github.com/nh-server/switch-guide , and the public site is https://switch.hacks.guide . The commit checked is `64db3a8`. Reliability is the community's official guide. The license is ISC, and it can be copied, including images, as long as the copyright notice and permission text are kept. The images used in the article and the permission text are collected in [LICENSE-switch-guide.txt](../assets/screenshots/LICENSE-switch-guide.txt).

- [Sending a Payload](https://switch.hacks.guide/user_guide/rcm/sending_payload): On all OSes, it points first to OmniRCM. macOS uses `OmniRCM-osx.zip`, Android uses an APK, and jailbroken iOS installs from a Sileo repository. The alternative is OmniRCM Web, which runs in Chromium-based browsers. It also writes that if the injection tool shows "Patched", the console is definitely patched
- [Getting Started](https://switch.hacks.guide/user_guide/getting_started): It says that using the serial number shown on the settings screen is more reliable than the label on the console. The table of ranges by the first 4 characters is based on a GBAtemp thread
- [SD Preparation](https://switch.hacks.guide/user_guide/all/sd_preparation): It warns that without placing `emummc.txt` in `atmosphere/hosts/`, emuMMC connects to Nintendo and a ban is likely. It says that on macOS you should choose "Merge" when copying folders
- [Launching CFW](https://switch.hacks.guide/user_guide/all/launching_cfw): It describes the names of the hekate boot entries, the meaning of `AMS` and `E`/`S` in the version notation, and two ways to open hbmenu (launching a game while holding the R button, and the album)
- [Game modding](https://switch.hacks.guide/extras/game_modding): It describes where to place mod zips according to their structure, disabling with the L button, the archive bit problem on Macs and how to fix it, and special steps for Super Smash Bros. Ultimate, BotW/TotK, and Animal Crossing: New Horizons
- [SimpleModManager](https://switch.hacks.guide/homebrew/simplemodmanager), [Tesla-Menu](https://switch.hacks.guide/homebrew/tesla-menu), [EdiZon](https://switch.hacks.guide/homebrew/edizon): Installation and use of each homebrew app

## ConsoleMods Wiki

The type is a volunteer wiki on console modding. The URL is https://consolemods.org . Reliability is aggregated. An earlier version of article 25 cited a page called `Switch:Mods` as a source, but this page did not exist. The pages in the Switch namespace were listed and checked with Special:AllPages.

- [Creating and Using EmuNAND](https://consolemods.org/wiki/Switch:Creating_and_Using_EmuNAND): It describes the NAND backup steps (RAW GPP after BOOT0 & BOOT1), that file-based emuMMC is less stable, and that hekate automatically backs up the SD card only when the data is under 1GB. There was no description of the "Type" field on hekate's emuMMC screen
- [Overlay Apps](https://consolemods.org/wiki/Switch:Overlay_Apps): It describes that nx-ovlloader loads Tesla Menu or Ultrahand, and that overlays are in `.ovl` format and placed in `switch/.overlays`. There was no description of Zing

## GBAtemp

The type is one of the largest overseas console modding forums. Reliability is personal. Post dates were checked with the `time` element of the threads.

- [RCM Loader - not being detected on PC](https://gbatemp.net/threads/rcm-loader-not-being-detected-on-pc.682629/) (June 2026): There is an answer saying that the RCM Loaders now in circulation are imitations with hekate written in permanently and cannot be rewritten from a PC. It also explains that a steady blue light means charging and blinking means injecting
- [RCM Loader OneB Update Firmware](https://gbatemp.net/threads/rcm-loader-oneb-update-firmware.594251/) (September 2021): Firmware updates for early products and the steps for replacing `payload.bin` in the folder
- [RCM Loader bootup showing static on Switch](https://gbatemp.net/threads/rcm-loader-bootup-showing-static-on-switch.638508/) (August 2023, with an addition in August 2025): A report that injecting from the dongle after updating CFW made the screen show noise
- [SAMD Fusee Payload Launcher V2](https://gbatemp.net/threads/samd-fusee-payload-launcher-v2.517731/) (September 2018): An introduction to an open source DIY dongle

## GameBrew

The type is a wiki on homebrew and ROM hacks. The URL is https://www.gamebrew.org . Reliability is aggregated, and the license is CC BY-SA 4.0.

- [CTGP Deluxe Switch](https://www.gamebrew.org/wiki/CTGP_Deluxe_Switch) (updated June 1, 2025): It says version 1.1.1, that Mario Kart 8 Deluxe 3.0.3 is required, and that emuMMC is strongly recommended

## News articles

Reliability is news reporting for both.

- [TheGamer: New Mod Adds Master Chief To Smash Ultimate](https://www.thegamer.com/new-mod-master-chief-smash-ultimate/) (June 2019): It writes that the Master Chief mod is a skin for Snake and that the moves remain Snake's
- [TechRaptor: Super Smash Bros Ultimate Steve Mod Brings Custom Skins To The Battle](https://techraptor.net/gaming/news/super-smash-bros-ultimate-steve-mod-custom-skins) (October 2020): It writes that jam1garner's mod can bring Java Edition Minecraft skins into the game

## Others

- [OmniRCM Web](https://omnircm.nintendohomebrew.com/web/): A browser version of the injection tool. It states explicitly that it runs only in Chromium-based browsers with WebUSB support (macOS, Linux, ChromeOS, Android) and that Windows is not supported. The screen was captured for the article
- [ARCropolis Wiki](https://github.com/Raytwo/ARCropolis/wiki): It describes how to open the Mod Manager, how to write `info.toml`, and the two locations for placing mods. The wiki's images have no stated license, so they are not copied into the repository and are referenced at their original location
- GitHub release pages ([hekate v6.5.4](https://github.com/CTCaer/hekate/releases/tag/v6.5.4), [Atmosphère 1.12.0](https://github.com/Atmosphere-NX/Atmosphere/releases/tag/1.12.0), [OmniRCM v1.1.1](https://github.com/DefenderOfHyrule/OmniRCM/releases/tag/v1.1.1)): File names in the Assets section were checked and captured for step 2 of the article. The hekate release notes say that `bootloader/update.bin` is loaded if it is newer, and that the `.reg` file for Windows is not needed on Linux or macOS. The OmniRCM release notes say that to use the in-app update of the macOS version, the app must be copied to the Applications folder
