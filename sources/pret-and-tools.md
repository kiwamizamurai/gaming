# pret and Pokémon modding tools

The type is the README and INSTALL documents of each GitHub repository. Reliability is official (each project's own materials). In this research, the contents were read with the `gh` command.

## pret

The README of each pret project is short and states what gets built and the SHA1 for verification.

[pokeemerald](https://github.com/pret/pokeemerald) is a decompilation of Pokémon Emerald and produces `pokeemerald.gba`. [pokefirered](https://github.com/pret/pokefirered) is a decompilation of the English versions of FireRed and LeafGreen. The ROMs it produces come in six kinds: regular, rev1, and Switch versions. [pokecrystal](https://github.com/pret/pokecrystal) is a disassembly of Crystal and produces ROMs of multiple versions. It points to an FAQ, documentation, a wiki, tutorials, symbols, and tools (gb-asm-tools), and questions are taken on Discord. [pokered](https://github.com/pret/pokered) is a disassembly of Red and Blue. Contact information and other projects are at [pret.github.io](https://pret.github.io/).

[pokeemerald's INSTALL.md](https://github.com/pret/pokeemerald/blob/HEAD/INSTALL.md) gives the steps for setting up a build environment. There are three methods for Windows: WSL1 (recommended and fastest), msys2 (about 2 times slower), and Cygwin (about 5 to 6 times slower). WSL2 can be faster than WSL1 if the files are placed on the WSL2 side. However, note that Porymap and other software using versions of Qt earlier than 5.15.2 can have problems with WSL2 network drive paths. On WSL1, install `build-essential`, `binutils-arm-none-eabi`, `git`, and `libpng-dev` on Ubuntu. The steps for Windows 7 and 8 carry a disclaimer that, since these OSes are out of support, fixes will be slow if the steps break in the future.

## pokeemerald-expansion

[pokeemerald-expansion](https://github.com/rh-hideout/pokeemerald-expansion) is a base for ROM hacks built on top of pret's pokeemerald. The README states explicitly that "this is not a playable Pokémon game on its own". The features it provides are hundreds of features from the series and features that improve playability. It asks users to credit RHH (Rom Hacking Hideout) and includes an example text. It cannot communicate with the official games, so it advises using the pret side if compatibility with the official games is needed. There is a warning not to use GitHub's "Download Zip", since it does not include commit history and does not allow updating or merging feature branches. The documentation is at https://rh-hideout.github.io/pokeemerald-expansion/ , and questions go to RHH's Discord.

## Porymap

[Porymap](https://github.com/huderlem/porymap) is a map editor for pokeruby, pokeemerald, and pokefirered. The license is LGPL-3.0, and there is an [official guide](https://huderlem.github.io/porymap/). Distributed builds exist for Windows and macOS. On Linux, you build from source or use an external package manager such as Flathub or the AUR.

## HexManiacAdvance

[HexManiacAdvance](https://github.com/haven1433/HexManiacAdvance) is an editor for the Pokémon GBA games. The targets are the English versions of Ruby, Sapphire, FireRed, LeafGreen, and Emerald, and functionality is reduced when other files are opened. What can be edited is data (Pokémon, trainers, moves, items, various constants), maps (maps, events, connections, warps), text (automatically relocating text that does not fit in its original location), images (conversion to and from PNG, palette management), and code (event scripts close to XSE, scripts for move effects and trainer AI and so on, and thumb code). It can also create and apply IPS and UPS patches, reorder the Pokédex, and export backups. The license is MIT, and it requires Windows and .NET 6.0.
