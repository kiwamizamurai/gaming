# 自分で用意するデータと権利のないゲーム

ROMとBIOSの置き方は [ROMとBIOSの扱い方](12-roms-and-bios.md) に書きました。この記事では、権利の面で問題なく遊べるデータの用意の仕方を、三つに分けて整理します。手元のカートリッジとディスクから自分で吸い出す方法、ホームブリューなど自由に配布されているゲーム、BIOSの代わりになるオープンソースの実装です。どれも公式の文書で確認した内容だけを書いています。

## 自分で吸い出す

libretroの[BIOSの説明](https://github.com/libretro/docs/blob/master/docs/guides/bios.md)は、RetroArchとlibretroが、著作権のあるシステムファイルやゲームのデータを共有しないと書いています。利用者が、それぞれの国の法律に従って、BIOSとゲームを自分で用意する前提です。ゲームの取り込みの[ガイド](https://github.com/libretro/docs/blob/master/docs/guides/import-content.md)も、内容を合法的に入手済みであることを前提にしています。

ゲームボーイとゲームボーイアドバンスのカートリッジは、専用のリーダーとソフトで吸い出せます。[FlashGBX](https://github.com/lesserkuma/FlashGBX)は、Windows、Linux、macOSで動くソフトで、カートリッジからROMとセーブデータを取り出せます。対応するリーダーは、GBxCart RW、GBFlash、Joey Jr、Game Bubです。吸い出した結果を保存の記録として残す、ダンプレポートの生成機能もあります。インターフェースは、英語、ドイツ語、簡体字中国語に対応しています。中国語の学習にも使えます。

## 吸い出しに必要なハードウェアと価格

カートリッジの吸い出しには、専用のリーダーが必要です。確認できた価格は、次のとおりです。

| 機器 | 価格 | 対応 | 出典 |
|---|---|---|---|
| GBxCart RW | 33ドルと送料(直販の場合) | GB、GBC、GBA | [GBxCart RW公式](https://www.gbxcart.com/) |
| Joey Jr | 42ドル | GB、GBC、GBA | [BennVenn's Shop](https://bennvenn.myshopify.com/collections/game-cart-to-pc-interface/products/usb-gb-c-cart-dumper-the-joey-jr) |

![GBxCart RWの公式ページ](../assets/screenshots/gbxcart-rw-home.jpg)

GBxCart RWの公式ページは、バックアップ、セーブの退避と復元、フラッシュカートの書き込みに使えると説明しています。Windowsでは、CH340/CH341のドライバーを入れる必要があります。Joey Jrのページは、ソフトやドライバーなしで、外付けのハードディスクのように使えると書いています。ROMとセーブをドラッグで取り出せます。USB-Cケーブルは付属しません。Macでは、隠しファイルがセーブを壊すおそれがあるため、FlashGBXを使うよう注意しています。ファームウェアは、そのページのもの以外で更新しないよう強調されています。Joey Jr系の価格は、ほかにJoeyN64が55ドルと表示されていました。

ほかに、GBFlashがあります。[GBFlash](https://github.com/simonkwng/GBFlash)は、GB/GBAのカードを高速に書き込む機器で、32ビットのARMプロセッサを持ちます。READMEによると、最速で毎秒550キロバイトを超え、FlashGBXが公式に対応しています。この調査では、価格のページを確認できませんでした。Game Bubは、公式サイトが「オープンソースのFPGAレトロエミュレーション携帯機」と説明していますが、価格はトップページに出ていませんでした。

## オープンソースの選択肢

吸い出しの周りには、オープンソースのソフトとハードが多くあります。ソフトは、FlashGBXがGPL-3.0です。[Open Source Cartridge Reader](https://github.com/sanni/cartreader)は、PCなしで、ROMとセーブをSDカードに吸い出せる、作りやすく改造しやすいリーダーです。ライセンスはGPL-3.0で、ファミコン、スーパーファミコン、NINTENDO64、ゲームボーイカラー、ゲームボーイアドバンス、メガドライブ、マスターシステムに対応します。アダプターを使うと、バーチャルボーイ、ゲームギア、PCエンジン、ワンダースワン、ネオジオポケット、Atari系などにも対応します。READMEの案内によると、開発は[oscartreaderのGitHub組織](https://github.com/oscartreader)に移りました。そこには、ファームウェア、カートリッジのデータベース、ハードウェアの設計ファイルが、別々のリポジトリで公開されています。設計ファイルがあるため、基板を自分で発注して作る学習にも向きます。完成品の価格は、この調査では確認できませんでした。

PS2のディスクは、[PCSX2の公式文書](https://pcsx2.net/docs/setup/discs/)に手順があります。Windowsでは、MPFというツールが使え、MPFの内部ではRedumperが動きます。ImgBurnも紹介されていますが、インストーラーにアドウェアが含まれるという警告が付いています。PS2のBIOSについても、PCSX2は[BIOSの取り出し方](https://pcsx2.net/docs/setup/bios/)を文書にしています。

![PCSX2のBIOSに関する公式文書](../assets/screenshots/pcsx2-bios-docs.jpg)

DuckStationは、PS1のBIOSが必要で、手元のゲーム機から取り出して使う方針です。BIOSの取り出しには、ゲーム機本体の改造が必要になることがあります。この調査では、その具体的な手順までは確認していません。

## 権利のないゲームを遊ぶ

ホームブリューは、個人やチームが作って、自由に配布しているゲームです。[Homebrew Hub](https://hh.gbdev.io/)は、ゲームボーイ、ゲームボーイアドバンス、ファミコン用のホームブリュー、デモ、音楽カートリッジ、ツールを集めたデータベースです。トップページの表示では、登録数は1629件で、ブラウザ上で動くエミュレーターも付いています。データは、ゲームボーイ用が[gbdev/database](https://github.com/gbdev/database)、ゲームボーイアドバンス用が[gbadev-org/games](https://github.com/gbadev-org/games)、ファミコン用が[nesdev-org/homebrew-db](https://github.com/nesdev-org/homebrew-db)という公開リポジトリで管理されています。

![Homebrew Hubのトップページ](../assets/screenshots/homebrew-hub-home.jpg)

トップページには、2026年6月13日から9月14日に開かれたGBA Jam 2026のような、ゲーム制作のイベントも載っています。作者や権利の扱いは、ゲームごとのページに書かれます。サイトの「disclaimer/DMCA」のページで、削除の依頼の扱いも確認できます。中身を遊ぶ前に、各ゲームのライセンス表記を見る習慣をつけると安全です。

Linux系のOSには、PortMasterがあります。[PortMasterの公式サイト](https://portmaster.games/)によると、これは、携帯機のLinux向けにポート(PC向けゲームの移植版)を入れて、更新と削除を管理するプログラムです。ダウンロード量は8MBで、ジャンルやランタイムで絞り込めます。2023年11月5日に、新しい版が告知されました。[導入のページ](https://portmaster.games/installation.html)は、Install.PortMaster.shを入手し、OSごとの決まったフォルダに置いて実行する手順を書いています。置き場所は、ROCKNIXが `/roms/ports/`、muOSが `/mnt/mmc/ROMS/Ports/`、Knulliが `/userdata/roms/ports`、ArkOSが `/roms/tools/` です。全部入りの版は、オフラインの機器に向くと説明されています。

![PortMasterの導入ページ](../assets/screenshots/portmaster-installation.jpg)

ほかに、権利の面で確認しやすいゲームがあります。[Freedoom](https://github.com/freedoom/freedoom)は、Doomのエンジンで遊べる、自由な内容のFPSです。ステージ、絵、効果音、音楽までを含みますが、動かすにはエンジンが別に必要です。[ScummVM](https://github.com/scummvm/scummvm)は、アドベンチャーゲームを動かす仕組みで、ゲームのデータファイルは利用者が用意する前提です。無料で配布されているゲームもありますが、どれが該当するかは、ScummVMの文書では確認していません。

## BIOSの代わりになる実装

エミュレーターによっては、BIOSなしで動かせます。libretroの文書は、HLEと呼ぶ方式を説明しています。これは、元の動作そのものではなく、出力を再現する方式で、不具合が起きやすいとされます。

[mGBA](https://github.com/mgba-emu/mgba)は、ゲームボーイアドバンスのBIOSを内蔵の実装で代替できます。外部のBIOSを読み込むこともできます。libretroの表では、mGBAのBIOSは任意です。同じ表で、PCSX ReArmedも任意で、Beetle PSX HWとSwanStationは必須です。ゲームボーイアドバンス向けには、MITライセンスの代替BIOSとして、[Cult-of-GBA/BIOS](https://github.com/Cult-of-GBA/BIOS)もあります。

PS1には、[PCSX-Redux](https://github.com/grumpycoders/pcsx-redux)のOpenBIOSがあります。READMEによると、市販のBIOSなしでPS1のゲームを起動できる、MIPS R3000A向けのBIOS実装です。市販のBIOSは著作権で保護されているため、その代替になるとも書かれています。ビルドには、MIPSのツールチェーンが必要です。

PS2は事情が違います。この調査で読んだPCSX2の公式文書は、BIOSを手元のゲーム機から取り出す方法だけを案内していて、オープンソースの代替には触れていません。

## 学べること

吸い出しを通して、カートリッジのメモリマッパーやセーブデータの仕組みを学べます。FlashGBXの対応一覧には、MBC1やMBC5など、ゲームボーイのマッパーが並んでいます。代替BIOSの実装は、ソースコードを読めるため、ゲーム機の起動の流れを学ぶ教材になります。ホームブリューは、GBA Jamのようなイベントで作られているので、自分で作る側に回る入り口にもなります。
