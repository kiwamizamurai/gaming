# ROCKNIX 手順ガイド

ROCKNIX Wiki(https://rocknix.org/)の内容を日本語で整理したもの。ROCKNIXは、ゲーム機向けのイミュータブルなLinuxディストリビューション。

## 概要

- 主な機能: ローカル、リモートのマルチプレイ、タッチ操作、電力とパフォーマンスのプロファイル、音楽・動画の再生、Bluetooth、HDMI/USB出力、Syncthing・rcloneによる同期、WireGuard・Tailscale・ZeroTierのVPN、RetroAchievements、スクレイピング
- ライセンス: GPL v2の部分と、各コンポーネントの個別のライセンスの混在。非営利利用のみのコンポーネントを含む
- コミュニティ: Discord、GitHub(ROCKNIX/distribution)

## 対応機種(公式Wikiのメニュー、2026-10-03に確認)

| メーカー | 機種 |
|---|---|
| Anbernic | RG351P/M/V、RG353P/M/V/VS、RG503、RG552、RG ARC、RG35XX 2024、RG35XX Plus、RG35XX Pro、RG35XX H、RG35XX SP、RG28XX、RG40XX V、RG40XX H、RG CubeXX |
| AYANEO | Pocket ACE、DMG、EVO、DS、S2 |
| AYN | Odin 2、Odin 2 Mini、Odin 2 Portal、Thor(SM8550)、Odin 3 |
| GameForce | Ace |
| Hardkernel | Odroid Go Advance、Go Super、Go Ultra |
| MagicX | XU Mini M |
| Mangmi | Air X |
| Powkiddy | RGB10、RGB10 Max 3 Pro、RGB10 Max 3、RGB10X、RK2023、RGB20SX、RGB20 Pro、RGB30、X35S、X35H、X55、XU10 |
| Retroid | Pocket 5、Pocket 6、Pocket Flip2、Pocket Mini、Pocket Nova |
| 無印 | R33S、R35S/R36S、EEクローン(K36など) |

RG406V、RG556、Retroid Pocket 4 Proは一覧にない。

## 機種ごとのSoCとハード(公式Wikiの各ページ)

| 機種 | SoC | CPU | GPU | 画面 | RAM |
|---|---|---|---|---|---|
| RG40XX H | Allwinner H700 | Cortex-A53 4コア 1.4GHz(設定で1.5GHz) | Mali G31 | 4.0インチ 640x480 | 1GB LPDDR4 |
| R35S/R36S | Rockchip RK3326 | Cortex-A35 4コア 1.3GHz | Mali G31 | 3.5インチ 640x480 | 1GB DDR3 |
| Retroid Pocket 5 | Snapdragon 865(SM8250) | 未記載 | Adreno(Freedreno + Turnip) | 未記載 | 未記載 |
| Retroid Pocket 6 | Snapdragon 8 Gen 2(SM8550) | 未記載 | Adreno(Freedreno + Turnip) | 未記載 | 未記載 |
| Ayn Odin 2 | Snapdragon 8 Gen 2(SM8550) | 未記載 | Adreno(Freedreno + Turnip) | 未記載 | 未記載 |

共通のソフトウェア構成: メインラインLinuxカーネル、Sway(コンポジタ)、EmulationStation(インターフェース)。

## インストール手順

### 1. イメージの用意

- Windowsなら「ROCKNIX Image Burner」を使い、メーカーと機種を選んで「Write Image to Drive」を押す
- 手動の場合は、リリースページから、機種のSoC別イメージ(例: RK3588、SM8250)をダウンロードして解凍し、Rufus、Raspberry Pi Imager、Win32 Disk Imager、`dd` などでSDカードに書き込む

### 2. 起動

- 電源を切った状態でSDカードを挿し、電源を入れる
- 機種によっては、起動順の設定でSDカードを先にする必要がある
- インストール処理が走り、再起動後にEmulationStationが起動する

### 注意

- OS領域はext4で、Windowsでは直接読めない。ROMの追加には、ネットワーク転送やUSBなどを使う
- 2枚目のSDカードスロットがある機種では、ext4、FAT32、exFATのカードをゲーム用として自動認識する

## Anbernic H700機種の追加手順

H700機種は、書き込み後、起動前に手作業が必要(1回だけ)。

1. ROCKNIXパーティションの `device_trees` フォルダから、機種に対応する `.dtb` ファイルを、パーティションのルートにコピーする
2. コピーしたファイルを `dtb.img`(小文字)にリネームする
3. OSの「取り出し」機能でSDカードを安全に取り出し、機種に挿して起動する

| 機種 | DTB |
|---|---|
| RG28XX | sun50i-h700-anbernic-rg28xx.dtb |
| RG34XX | sun50i-h700-anbernic-rg34xx.dtb |
| RG34XX SP | sun50i-h700-anbernic-rg34xx-sp.dtb |
| RG35XX 2024 | sun50i-h700-anbernic-rg35xx-2024.dtb(rev6は -rev6-panel) |
| RG35XX H | sun50i-h700-anbernic-rg35xx-h.dtb(rev6は -rev6-panel) |
| RG35XX Plus | sun50i-h700-anbernic-rg35xx-plus.dtb(rev6は -rev6-panel) |
| RG35XX Pro | sun50i-h700-anbernic-rg35xx-pro.dtb |
| RG35XX SP | sun50i-h700-anbernic-rg35xx-sp.dtb(v2は -v2-panel) |
| RG40XX H | sun50i-h700-anbernic-rg40xx-h.dtb |
| RG40XX V | sun50i-h700-anbernic-rg40xx-v.dtb |
| RG CubeXX | sun50i-h700-anbernic-rgcubexx.dtb |

- RG35XX系は、基板のリビジョンで2種類のDTBがある。外見からは判別できない。画面が乱れたら、電源を10秒長押しで切り、再書き込みして、もう一方のDTBを試す。
- 起動前にSDカードを安全に取り出さないと、起動できなくなることがある。その場合は、最初から書き直す。

## Retroid Pocket 5のインストール

公式のRP5ページの手順。

1. SM8250版のROCKNIXを、SDカードに書き込む
2. Android側で、SDカードの `rocknix_abl` フォルダを内部ストレージのルートにコピーする
3. 設定の「Handheld Settings」「Advanced」「Run Script as Root」で、`rocknix_abl` フォルダを選択する
4. `backup_abl.sh` で、いまのABLをバックアップする
5. `flash_abl.sh` で、ROCKNIXのABLを書き込む
6. 再起動し、Vol-を押したままでROCKNIX ABLに入る。Vol-/Vol+で選び、電源ボタンで決定
7. 「Set device model」で、Retroid Pocket 5(またはVisionox版)を選ぶ
8. 「Switch boot mode」で、Linuxにする
9. 「Start」で、ROCKNIXが起動する

リスク: ABLを書き換えるため、故障や保証への影響の可能性がある。バックアップを必ず取る。

RP6、Odin 2では、フラッシュ後、Vol-を押して起動すると、fastbootメニューの「Switch boot mode」で切り替える。

## ゲームの追加

方法は複数ある(公式Wikiの「Add Games」)。

### ストレージの考え方

- ROCKNIXは、`roms` フォルダ内のゲームを認識する
- 外部SDがext4なら、内蔵と外部をまとめる「Merged Storage」が使える(初期設定は無効)
- exFAT、FAT32の場合は「Simple Storage」。外部カードの `roms` が `/storage/roms` に見える
- ゲームが表示されない場合は、`/usr/bin/cleanup_overlay` を実行する(再起動する)

### ネットワーク転送

- Wi-Fiを設定し、IPアドレスを確認する。rootのパスワードは初期値が `rocknix`
- HTTP: 「Simple HTTP Server」を有効にして、ブラウザからアップロードする
- SMB: Windowsは `\\<ホスト名>.local` または `\\<IP>`、Macは Finder で `smb://<アドレス>`。ユーザー名は `root`
- SFTP/SSH: ポート22、`scp` も使える
- 追加後は、STARTメニューの「Game Settings」「Update Gamelists」で一覧を更新する

### USBガジェット

- ネットワークガジェット(ECM): PCとの間にネットワーク接続ができる。SambaかSFTPを使う
- ファイル転送ガジェット(MTP): 簡単だが、失敗することがある

### SDカード

- 2スロットの機種は、スロット2のカードをゲーム用にする
- 1スロットで、内蔵にインストールした場合は、「Autodetect Games Card」を有効にして、FAT32/exFAT/ext4のカードを使う
- リカバリモード(Vol-を押しながら起動、RP5/MiniはGRUBメニューのRECOVERY)で、PCからストレージを見られる

### その他

- USBドライブ: ROCKNIXのFile Managerから使う
- Linux PC: ext4なので、SDカードを直接読み書きできる
- NFS: `/storage/.nfs-mount` に `NFS_PATH=<NFS URI>` を書き、ToolsのMount NFSを実行する

## アップデート

- OTA: STARTメニュー、System Settings、System Updateの「Start Update」
- 手動: リリースページの更新用 `.tar` を、`/storage/.update`(SCP)またはSambaの `update` 共有に置いて、再起動する
- 開発ビルド: Discordのdevビルドのチャンネルで配布される。スクレイピングとRetroAchievementsの認証情報が含まれず、これらの機能は動かない

## EmulationStationの設定メニューのトピック

公式Wikiに個別のページがある。

- テーマ(configure/themes)
- スクレイパー(configure/scraper)
- コレクション(configure/collections)
- シェーダー(configure/shaders)
- ゲームガイド(configure/gameguides)
- オーバーレイ(configure/overlays)
- ネットワーク(configure/networking)
- HDMI(configure/hdmi)
- クラウド同期(configure/cloud-sync)
- VPN(configure/vpn)
- パッケージ(configure/packages)
- フェイクサスペンド(configure/fake-suspend)
- RetroAchievements(play/retro-achievements)
- コントロール、ネットプレイ(play/controls、play/netplay)

## 対応するシステム(公式Wikiのsystemsメニュー)

- アーケード: CPS1/2/3、Daphne、FBNeo、MAME、Atomiswave、Naomi、Neo Geo
- 家庭用: Amiga CD32、Atari 2600/5200/7800/Jaguar、ColecoVision、Xbox、PC Engine、SuperGrafx など
- 携帯機: Arduboy、Atari Lynx、WonderSwan、GP32、Game & Watch、GB、Virtual Boy、GBC、GBA、Pokemon mini、NDS、3DS
- コンピュータ: Amiga、Amstrad CPC、Atari 800/ST、C64、MSX、PC、PC-88、PC-98、Palm など
- ゲームエンジン、その他: Build Engine、Doom、CHIP-8、EasyRPG、id Tech、Z-Machine、J2ME、OpenBOR、PICO-8、ScummVM、TIC-80、Vircon32
- ストリーミング、アプリ: Moonlight、mplayer、Music、Ports、Steam、Heroic

## 学べること

- LinuxのブートプロセスとABLの役割
- デバイスツリー(dtb)が、ハードウェアの構成をOSに伝える仕組み
- 画像のフラッシュ、パーティション(ext4とFAT)
- SSH/SFTP/SMB/NFS、VPN(Tailscale、WireGuard)
- EmulationStationのgamelistとスクレイピング
