# Pegasus official materials

The type is the README and documentation of the frontend Pegasus. The README URL is https://github.com/mmatyas/pegasus-frontend and the documentation source is at https://github.com/mmatyas/pegasus-docs . The public site https://pegasus-frontend.org could not be read by the browser used in this research. Reliability is official.

## README

It describes Pegasus as a frontend for browsing a game library and launching various emulators from one place. Its features are being open source and multi-platform (Windows, Linux, Mac, Android, various Raspberry Pi models, Odroid), themes that can completely change the UI (user shaders can also be used), compatibility with EmulationStation gamelist files, gamepad support, support for multiple aspect ratios, a portable mode, and live reloading of themes. The license is GPLv3, and logos of included products and the like may need separate permission for commercial use. Building requires a C++11 compiler, Qt 5.15.0 or later (QML, Multimedia, SVG, SQL), and SDL or Qt Gamepad.

## Metadata files

[meta-files.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-files.md) explains the format of `metadata.pegasus.txt` (or `metadata.txt`). The file is a sequence of `name: value` entries, and in multi-line values the second and later lines start with a space or tab. Lines starting with `#` are comments. Collections (groupings such as by system) can use `collection` (required), `launch` (a shared launch command), `workdir`, `extension`, `file`, `regex`, `directory`, `ignore-extension`, `ignore-file`, `ignore-regex`, `shortname`, `sort-by`, `summary`, and `description`. Games can use `game` (required), `file`, `developer`, `publisher`, `genre`, `tag`, `summary`, `description`, `slug`, `players`, `release`, `rating`, `launch`, and `workdir`. Names starting with `x-` are for software such as scrapers to write their own data.

The variables usable in launch commands are `{file.path}`, `{file.uri}`, `{file.name}`, `{file.basename}`, `{file.dir}`, and `{env.variable_name}`. On Android, some apps want a direct file path and others a content URI, so `{file.path}` and `{file.uri}` are used accordingly. On Android 11 and later, app file access is restricted, and per-directory permissions may be needed.

## Assets and Android

[meta-assets.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-assets.md) is a document explaining how covers, logos, videos, and the like are found. The priority order is what is specified per game in the metadata file, what is specified as a collection default, files with fixed names inside `<folder>/media/<game name>/`, and third-party data sources. For large numbers of games, it introduces scrapers such as Universal XML Scraper, Steven Selph's Scraper, Skraper.net, and Skyscraper.

[platform-android.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md) is a document stating that it runs on Android 5.0 and later, is distributed as an APK, and that its settings folder is `<storage>/pegasus-frontend`. It can also be set as the default launcher. When launching other apps, it uses the Activity Manager's `am start`, and an example of opening a file with `android.intent.action.VIEW` is included.
