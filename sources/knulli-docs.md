# Knulliの公式ドキュメント

種類は、カスタムファームウェアKnulliのドキュメントのソースです。URLは https://github.com/knulli-cfw/knulli.org です。公開サイトの https://knulli.org は、この調査のブラウザでは読み取れなかったため、GitHubのソースを `gh` コマンドで読みました。信頼度は公式です。プロジェクトの本体は https://github.com/knulli-cfw/knulli-linux で、旧リポジトリのREADMEには、新しいリポジトリへの案内があります。

## プロジェクトの説明

[About Knulli](https://github.com/knulli-cfw/knulli.org/blob/main/docs/about-knulli.md)は、Knulliを、Batoceraをフォークしたカスタムファームウェアと説明しています。標準のLinuxカーネルと互換性がない携帯機や、特別な対応が必要な機種向けに合わせたものです。エミュレーターの設定を、各エミュレーターの画面ではなく、EmulationStationで、機種ごとまたはゲームごとに行うのが特徴です。RetroArchの画面は使わないよう勧めています。必要な人向けには、オーバーライドとリマップのファイルを、機種ごとまたはゲームごとに使う方法が用意されています。フォルダの構造は厳格で、大文字と小文字を区別します。

内蔵の機能は、エミュレーターとポート(PortMasterを含む)、PICO-8のネイティブ版への対応、ScreenScraper、TheGamesDB、ArcadeDBからの情報取得、RetroAchievements、Bluetooth、HDMI出力、SMBによる無線のファイル追加、画面の枠(ベゼル)、テーマ、動的なコレクションと手作りのコレクション、Syncthing、RGB LED、SSH、クラムシェル型の機種での蓋を閉じたときの動作です。

## 導入

[Quick Start Guide](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/quick-start.md)は、機種ごとの準備、イメージの書き込み、保存先の設定、Wi-Fi、ゲームとBIOSの追加、PortMasterの導入、スクレイピング、RetroAchievementsの順に説明しています。RetroidのPocket 5、Flip 2、Mini、Mini V2とMiyooのFlipは、書き込みの前に準備が必要です。

[導入](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/install.md)のページは、機種用のイメージを取得し、複数の部分に分かれていれば7zipで解凍して、SDカードに書き込み、機種に挿して起動する流れを書いています。書き込み後に、Windowsが読めないパーティションの初期化を勧めても、してはいけません。

[パーティションの解説](https://github.com/knulli-cfw/knulli.org/blob/main/docs/guides/partitioning.md)は、書き込み後のSDカードが6つの区画になることを書いています。約36MBの未割り当て領域、20MBと16MBのLinux用領域、4GBでFAT32の `BATOCERA`、512MBの `SHARE`、そして残りの空き領域です。`SHARE` は、初回の起動で最大まで広がり、exFATで初期化されます。Knulli Gladiatorのリリースより前は、ext4で初期化されていました。

## 機種のページ

[対応機種の一覧](https://github.com/knulli-cfw/knulli.org/blob/main/docs/devices/index.md)は、Anbernic(RG Arc S、RG28XX、RG34XX、RG35XX Plus、2024、H、SP、RG40XX H/V、RGCubeXX)、GoRetroid(Retroid Pocket 5、Mini)、Miyoo(Flip)、Powkiddy(RGB30、X55)、TrimUI(Brick、Smart Pro)を載せています。

[RG40XX H](https://github.com/knulli-cfw/knulli.org/blob/main/docs/devices/anbernic/rg40xx-h.md)は、Allwinner H700、カーネルはAllwinner BSP 4.9.170、GPUはMali G31です。機能は、Wi-Fi、Bluetooth、サスペンド(電源ボタンの短押し)、HDMI、互換のUSB Wi-Fiドングルです。[Retroid Pocket 5](https://github.com/knulli-cfw/knulli.org/blob/main/docs/devices/goretroid/retroid-pocket-5.md)は、SDカードから起動する手順を書いています。

[BIOSの説明](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/bioses.md)は、BIOSに著作権があるため、Knulliには付属しないと書いています。必要なBIOSの確認は、ゲーム設定の「Missing BIOS check」で行います。
