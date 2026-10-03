# ROMとBIOSの扱い方

エミュレーターで遊ぶには、ゲームのデータ(ROM)と、機種によっては、元のゲーム機の起動用データ(BIOS)が必要です。このページでは、ROMとBIOSの置き方、正しいデータかを確かめる方法、権利の考え方を、公式の文書から整理します。入手先の案内や、配布のリンク、ダウンロードの手順は書きません。ROMとBIOSには著作権があり、配布されているものの多くが、権利者の許可を得ていないためです。

## BIOSとは何か

Knulliの[BIOSの説明](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/bioses.md)では、BIOSはコンピューターのハードウェアに低水準でアクセスする基本的なソフトウェアです。一部のゲーム機にもBIOSがあり、エミュレーションで必要になる場合があります。BIOSもゲームと同じく著作権で保護されるため、KNULLIには付属しません。利用者が自分で用意する決まりだと、同じ文書は説明しています。

## 置き場所と名前

ROCKNIXでは、ゲームを `roms` フォルダに入れ、BIOSは `roms/bios` の下に置きます。たとえば、[Retroid Pocket 5のページ](https://rocknix.org/devices/retroid/retroid-pocket-5/)は、PS2のエミュレーターに必要なBIOSのファイル名と置き場所を `/roms/bios/aethersx2/bios`、XboxのxemuのBIOSを `/roms/bios/xemu/bios`、PS1のDuckStationのBIOSを `/roms/bios` とのことです。ファイル名は決まっています。Knulliは、エミュレーターがBIOSのファイルを、非常に決まった名前で、ときには決まったサブフォルダの中に期待すると説明しています。Knulliは大文字と小文字を区別するため、名前の大文字と小文字も合わせる必要があります。

Knulliには、BIOSが足りているかを調べる機能があります。STARTボタンのメニューから、ゲーム設定の「Missing BIOS check」を開くと、足りないBIOSと、チェックサムが合わないBIOSが分かります。チェックサムが合わなくても、実際には動く場合があるため、置き場所が正しければ、ゲームを起動して試すよう案内されています。Windowsでは、ファイルの拡張子を表示させておくと、`.bin.bin` のような二重の拡張子や、`.bin.zip` のような間違いを防げます。ゲームを起動するときに、BIOSの不足を警告する機能もあり、設定で切れます。

## ゲームの管理とメタデータ

ROMを増やすと、一覧の見た目を整える作業が必要になります。Knulliは、ScreenScraper、TheGamesDB、ArcadeDBから、カバー画像や説明を自動で取得する機能を持っています。ROCKNIXにも、同じ目的のスクレイパーがあります。Pegasusは、ゲームごとの情報を `metadata.pegasus.txt` に書き、カバーや動画を、`media/<ゲーム名>/` の決まった名前のファイルで探します([Pegasusのメタデータ](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-files.md))。仕組みは [フロントエンドと天馬G](05-frontend-tianma-g.md) に書きました。

## 正しいデータかを確かめる

ROMの内容が正しいかは、チェックサムで確かめられます。pretの[pokeemerald](https://github.com/pret/pokeemerald)のREADMEには、ビルドで作れるROMのSHA1の値が載っています。それぞれに、ROMのデータベース「No-Intro」の記録へのリンクが添えられています。ビルドしたROMのSHA1がこの値と同じなら、期待どおりのデータだと確認できます。

## 改造とパッチ

ゲームの改造では、元のROMを書き換えた完成品ではなく、差分のパッチを使う方法があります。[HexManiacAdvance](https://github.com/haven1433/HexManiacAdvance)は、IPSとUPSのパッチを作って適用できます。パッチだけを共有し、利用者が自分のROMに当てる形なら、原作のデータそのものの再配布を避けられます。詳細は [ポケモンのROM hack](08-pokemon-hacking.md) に書きました。

## 権利の考え方

このリポジトリで確認できた公式の文書は、どれも、ROMとBIOSを付属させないと書いています。KnulliはBIOSを同梱せず、pretは、ビルドの手順と、確認用のSHA1だけを公開しています。天馬Gのパックは、CSDNの記事によると、エミュレーターの制作者や工房が公式には提供しない種類のデータが入っていて、国内のコミュニティが整理したものです([天马G前端的使用](https://blog.csdn.net/fanged/article/details/152960565))。こうしたパックの入手は、権利の面で問題があるため、このリポジトリでは扱いません。

自分で用意する方法として、手元に持っているゲームのカートリッジやディスクから、データを取り出す方法があります。必要な機器と価格、オープンソースのツール、権利のないゲームの遊び方、BIOSの代替は、[自分で用意するデータと権利のないゲーム](13-own-data-and-free-games.md)にまとめました。
