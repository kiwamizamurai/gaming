# Switchのコミュニティサイトとガイド

[記事25](../articles/25-switch-cfw.md)の出典のうち、コミュニティのガイドや掲示板、ニュース記事をまとめたノートです。確認日は、すべて2026年10月15日です。Webページは、Claude in Chrome(ChromeのmacOS版)で開いて読みました。GitHubのリポジトリは、浅いクローンで原文を読みました。

## Switch Guide(nh-server/switch-guide)

種類は、Nintendo Homebrewが運営する導入ガイドのソースです。URLは https://github.com/nh-server/switch-guide 、公開サイトは https://switch.hacks.guide です。確認したコミットは `64db3a8` です。信頼度は、コミュニティの公式ガイドです。ライセンスはISCで、著作権表示と許諾文を残せば、画像を含めて複製できます。記事で使った画像と許諾文は、[LICENSE-switch-guide.txt](../assets/screenshots/LICENSE-switch-guide.txt)にまとめました。

- [Sending a Payload](https://switch.hacks.guide/user_guide/rcm/sending_payload):すべてのOSで、まずOmniRCMを案内しています。macOSは `OmniRCM-osx.zip`、AndroidはAPK、脱獄済みiOSはSileoリポジトリから入れます。代わりの方法は、Chromium系ブラウザで動くOmniRCM Webです。注入ツールが「Patched」と出せば確実に対策済み、とも書いています
- [Getting Started](https://switch.hacks.guide/user_guide/getting_started):シリアル番号は、本体のラベルより設定画面の表示を使うほうが確実だとしています。先頭4文字ごとの範囲の表は、GBAtempのスレッドをもとにしています
- [SD Preparation](https://switch.hacks.guide/user_guide/all/sd_preparation):`emummc.txt` を `atmosphere/hosts/` に置かないと、emuMMCが任天堂に繋がり、BANされる可能性が高いと警告しています。macOSでは、フォルダのコピー時に「結合」を選ぶよう書いています
- [Launching CFW](https://switch.hacks.guide/user_guide/all/launching_cfw):hekateの起動項目の名前、バージョン表記の `AMS` と `E`/`S` の意味、hbmenuを開く2つの方法(Rボタンを押しながらゲームを起動、アルバム)を書いています
- [Game modding](https://switch.hacks.guide/extras/game_modding):MODのzipの構成ごとの置き方、Lボタンでの無効化、Macでのアーカイブビットの問題と直し方、スマブラSP・BotW/TotK・あつ森の特別な手順を書いています
- [SimpleModManager](https://switch.hacks.guide/homebrew/simplemodmanager)・[Tesla-Menu](https://switch.hacks.guide/homebrew/tesla-menu)・[EdiZon](https://switch.hacks.guide/homebrew/edizon):各ホームブリューの導入と使い方です

## ConsoleMods Wiki

種類は、ゲーム機の改造についての有志のWikiです。URLは https://consolemods.org です。信頼度は集約です。以前の版の記事25は `Switch:Mods` というページを出典にしていましたが、このページは存在しませんでした。Switchの名前空間にあるページは、Special:AllPagesで一覧にして確認しました。

- [Creating and Using EmuNAND](https://consolemods.org/wiki/Switch:Creating_and_Using_EmuNAND):NANDのバックアップの手順(BOOT0 & BOOT1の後にRAW GPP)、ファイル方式のemuMMCは安定性が劣ること、hekateがSDカードを自動でバックアップするのはデータが1GB未満のときだけであることを書いています。hekateのemuMMC画面の「Type」欄についての記述は、ありませんでした
- [Overlay Apps](https://consolemods.org/wiki/Switch:Overlay_Apps):nx-ovlloaderが、Tesla MenuかUltrahandを読み込むこと、オーバーレイは `.ovl` 形式で `switch/.overlays` に置くことを書いています。Zingについての記述は、ありませんでした

## GBAtemp

種類は、海外最大級のゲーム機改造の掲示板です。信頼度は個人です。投稿の日付は、スレッドの `time` 要素で確認しました。

- [RCM Loader - not being detected on PC](https://gbatemp.net/threads/rcm-loader-not-being-detected-on-pc.682629/)(2026年6月):今出回っているRCM Loaderは、hekateが固定で書き込まれた模倣品で、PCから書き換えられない、という回答があります。青い点灯は充電中、点滅は注入中という説明もあります
- [RCM Loader OneB Update Firmware](https://gbatemp.net/threads/rcm-loader-oneb-update-firmware.594251/)(2021年9月):初期の製品のファームウェア更新と、フォルダの `payload.bin` を差し替える手順です
- [RCM Loader bootup showing static on Switch](https://gbatemp.net/threads/rcm-loader-bootup-showing-static-on-switch.638508/)(2023年8月、2025年8月に追記):CFWの更新後に、ドングルから注入すると画面がノイズになった、という報告です
- [SAMD Fusee Payload Launcher V2](https://gbatemp.net/threads/samd-fusee-payload-launcher-v2.517731/)(2018年9月):オープンソースのDIYドングルの紹介です

## GameBrew

種類は、ホームブリューとROMハックのWikiです。URLは https://www.gamebrew.org です。信頼度は集約で、ライセンスはCC BY-SA 4.0です。

- [CTGP Deluxe Switch](https://www.gamebrew.org/wiki/CTGP_Deluxe_Switch)(2025年6月1日更新):版1.1.1、マリオカート8 デラックスの3.0.3が必要、emuMMCを強く推奨、と書いています

## ニュース記事

信頼度は、どちらも報道です。

- [TheGamer:New Mod Adds Master Chief To Smash Ultimate](https://www.thegamer.com/new-mod-master-chief-smash-ultimate/)(2019年6月):マスターチーフのMODが、スネークのスキンで、技はスネークのままであることを書いています
- [TechRaptor:Super Smash Bros Ultimate Steve Mod Brings Custom Skins To The Battle](https://techraptor.net/gaming/news/super-smash-bros-ultimate-steve-mod-custom-skins)(2020年10月):jam1garnerのMODが、Java版Minecraftのスキンをゲームに取り込めることを書いています

## そのほか

- [OmniRCM Web](https://omnircm.nintendohomebrew.com/web/):ブラウザ版の注入ツールです。WebUSBに対応したChromium系ブラウザ(macOS・Linux・ChromeOS・Android)でだけ動き、Windowsは非対応と明記しています。画面は、記事用に撮影しました
- [ARCropolis Wiki](https://github.com/Raytwo/ARCropolis/wiki):Mod Managerの開き方、`info.toml` の書き方、MODの2つの置き場所を書いています。Wikiの画像は、ライセンスが明記されていないため、リポジトリには複製せず、元の場所を参照しています
- GitHubのリリースページ([hekate v6.5.4](https://github.com/CTCaer/hekate/releases/tag/v6.5.4)、[Atmosphère 1.12.0](https://github.com/Atmosphere-NX/Atmosphere/releases/tag/1.12.0)、[OmniRCM v1.1.1](https://github.com/DefenderOfHyrule/OmniRCM/releases/tag/v1.1.1)):Assets欄のファイル名を確認し、記事の手順2用に撮影しました。hekateのリリースノートは、`bootloader/update.bin` が新しければ読み込まれること、Windows用の `.reg` ファイルはLinux・macOSでは不要なことを書いています。OmniRCMのリリースノートは、macOS版のアプリ内更新を使うには、アプリをアプリケーションフォルダにコピーしておく必要があると書いています
