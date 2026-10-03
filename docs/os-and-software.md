# OSとソフトウェア

## Android機とLinux系OS

CSDNの記事(天马G前端的使用)の比較表を要約したもの。個人の見解を含む。

| 項目 | Android機 | Linux系(ArkOS、JELOS、Batocera) |
|---|---|---|
| 起動速度 | 20〜40秒 | 5秒以内 |
| UIの統一感 | アプリごとにばらばら | 一つのゲーム用プラットフォームとして統一 |
| PS2 | AetherSX2で可 | 公式のLinux版coreは未成熟とされる |
| Switch | 社区版のYuzuがある | 事実上不可 |
| クラウドゲーム、Steam Link | 対応 | Moonlightのみ |
| システムの自由度 | rootが必要、改造は難しい | 自由に改造できる |
| 手間 | ROMを入れてAPKを設定するだけ | BIOSやcoreの手動設定が必要 |

PS2エミュレーターがAndroidに偏る理由として、記事は次のように書いている。AetherSX2はAndroid NDKとVulkan/OpenGL ESを使ってJITを実装しており、Linuxには移植しにくい。

## ROCKNIX

Linux系のゲーム機向けOS。公式Wikiの対応機種一覧(確認済み)には、Anbernic RG40XX H、RG40XX V、RG CubeXX、Retroid Pocket 5、6、Flip2、Mini、Nova、AYN Odin 2などが載っている。Retroid Pocket 4 Proは載っていない。

![ROCKNIX WikiのRetroid Pocket 5ページ](../assets/screenshots/rocknix-retroid-pocket-5.jpg)

Retroid Pocket 5のページ(https://rocknix.org/devices/retroid/retroid-pocket-5/)に書かれていること:

- SoCはQualcomm SD865(SM8250)で、メインラインLinuxカーネルを使う
- GLドライバはFreedreno、VulkanドライバはTurnip
- インターフェースはSwayとEmulationStationの組み合わせ
- 対応エミュレーター: Mupen64Plus-SA(N64)、PPSSPP-SA(PSP)、Dolphin(GC/Wii)、AetherSX2(PS2)、Xemu(Xbox)、DuckStation(PS1)、Azahar(3DS)、BigPEmu(Atari Jaguar)
- インストール手順: SDカードへのイメージ書き込み、ROCKNIX用ABL(Android Bootloader)の書き込み、デバイスモデルの設定とブートモードのLinuxへの切り替え
- ABLの書き込みは、Android側の「Run Script as Root」機能でスクリプトを実行する
- デュアルスクリーンのアドオンは、手動設定のみ

ブートローダを書き換える作業には、変更前の保存(backup_abl.sh)と、故障、保証への影響のリスクがある。

## 他のOS、改造の情報(検索結果の抜粋、中身は未確認)

- LineageOS公式Wikiに、Retroid Pocket Novaの項目がある(RP5、RP4 Proは確認できていない)
- XDA Forumsに「Rooting the Retroid Pocket 4 Pro」のスレッドがある
- Retroid Pocket 4 Proは、公式OTAで画面の色味や操作感の調整が続いている(百度文库の記事、1.0.0.16)

## フロントエンドと天馬G

フロントエンドは、ゲームの一覧を見やすく表示して、選んだゲームを対応するエミュレーターで起動するアプリ。

- Pegasus: オープンソースのフロントエンド(公式 https://pegasus-frontend.org/)。Qtで作られている
- 天馬G: Pegasusを中国語化したもの。「跳坑者联盟」が整合包として配布している。PC版とAndroid版がある
- 構造(CSDN記事より):
  - 前端(Pegasus): カバー壁とメニューの表示
  - 模拟核心(RetroArchや各種エミュレーターのAPK): ゲームの実行
  - 資源層: ROM、BIOS、カバー画像、動画、中国語のメタデータ
- Android版は、Pegasusが `am start` 相当のIntentで外部のエミュレーターAPKを起動する(CSDN記事に核心コードの抜粋あり)
- メタデータは `metadata.pegasus.txt` のようなファイルに書かれる。ゲームのファイル名と表示名、カバーのパスを関連づける(百度AI要約。未検証)
- フォルダ構成の例(百度AI要約。未検証): `roms`、`bios`、`media`、`theme`
- データのパック全体は約2.8TB、約1万本とされる(配布サイトの記述)。精簡版は220GBの例がある

## 主なエミュレーター(Android)

| プラットフォーム | 例 |
|---|---|
| FC | fceumm |
| SFC | snes9x |
| GBA | mGBA |
| アーケード | FBNeo |
| PS1 | PCSX ReARMed、DuckStation |
| PSP | PPSSPP |
| PS2 | AetherSX2 |
| GC/Wii | Dolphin |
| 3DS | Azahar |

(百度AI要約とROCKNIXページから。表の中身は未検証)

## 用語メモ

- JIT / Dynarec: 実行中に、元のゲーム機の命令を、動かしている機械の命令に翻訳する技術。PS2やSwitchのエミュレーションの速度の鍵になる
- フロントエンド: ランチャー。ゲームの選択と起動を担う
- ブートローダ(ABL): OSを起動する前の最初のソフト。書き換えるとOSを入れ替えられるが、リスクがある
- BIOS: 一部のエミュレーターが必要とする、元のゲーム機の起動用データ
