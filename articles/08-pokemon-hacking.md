# ポケモンのROM hack

ポケモンの改造版は、中国語で「口袋妖怪改版」と呼ばれ、大きなコミュニティを作っています。作る側の道具は、オープンソースで公開されたものが中心で、ソースからビルドする方法と、ROMのデータを直接編集する方法があります。

## 作り方の分類

作り方は、大きく3つの分類です。1つ目は、作者が公開した差分のパッチを、元のROMに適用して遊ぶ方法です。2つ目は、HexManiacAdvanceのような専用のエディタで、ROMのデータを直接書き換える方法になります。3つ目は、ゲームのソースコードを逆アセンブルまたは逆コンパイルして作ったプロジェクトを、ビルドする方法です。

## ソースからビルドする

[pret](https://pret.github.io/)は、ポケモンの逆アセンブルと逆コンパイルのプロジェクトを公開している団体です。[pokered](https://github.com/pret/pokered)は赤と青、[pokecrystal](https://github.com/pret/pokecrystal)はクリスタルの逆アセンブルで、いずれもアセンブリ言語で書かれています。[pokeemerald](https://github.com/pret/pokeemerald)はエメラルド、[pokefirered](https://github.com/pret/pokefirered)はファイアレッドとリーフグリーンの逆コンパイルで、C言語です。READMEには、ビルドして得られるROMの種類と、それぞれのSHA1の値が書かれています。たとえば、pokeemeraldが作る `pokeemerald.gba` のSHA1は `f3ae088181bf583e55daf962a92bb46f4f1d07b7` です。

ビルド環境の作り方は、[pokeemeraldのINSTALL.md](https://github.com/pret/pokeemerald/blob/HEAD/INSTALL.md)が説明しています。Windows 10と11では、WSL1が最も速く、強い推奨があります。遅さの目安は、msys2がWSL1の約2倍、Cygwinが約5〜6倍だそうです。WSL2は、ファイルをWSL2側に置けば、WSL1より速い場合もあります。ただし、Qt 5.15.2より前のバージョンを使うPorymapのようなツールは、WSL2のネットワークドライブのパスを読めないことがあります。必要なパッケージは、Ubuntuでは `build-essential`、`binutils-arm-none-eabi`、`git`、`libpng-dev` の4つです。

エメラルドをもとにした改造の元になるプロジェクトとして、[pokeemerald-expansion](https://github.com/rh-hideout/pokeemerald-expansion)があります。READMEによると、pretのpokeemeraldの上に作られた、ROM hackの基盤です。これ自体は遊べるゲームではありません。ポケモンのシリーズに登場した何百もの機能と、遊びやすさを上げる機能を備えています。使うときは、RHH(Rom Hacking Hideout)をクレジットとして書くよう求められます。公式のポケモンのゲームとは通信できません。公式のゲームとの互換性が必要なら、pret側のpokeemeraldを使うよう説明があります。READMEには、GitHubの「Download Zip」を使うと、コミット履歴が含まれず、更新やブランチの統合ができないため、使わないようにという注意もあります。

## 地図とデータを編集する

[Porymap](https://github.com/huderlem/porymap)は、pokeruby、pokeemerald、pokefireredのための地図エディタです。[公式のガイド](https://huderlem.github.io/porymap/)があり、WindowsとmacOSには配布ビルドがあります。Linuxでは、ソースからビルドします。

![Porymapの画面。出典はPorymapのリポジトリ](https://raw.githubusercontent.com/huderlem/porymap/master/docsrc/manual/images/introduction/porymap-loaded-project.png)

[HexManiacAdvance](https://github.com/haven1433/HexManiacAdvance)は、ポケモンのGBA作品のためのエディタです。READMEによると、対象はRuby、Sapphire、FireRed、LeafGreen、Emeraldの英語版で、ポケモン、トレーナー、技、アイテムのデータ、地図とイベント、テキスト、画像、イベントスクリプトを編集できます。IPSとUPSのパッチを作成して適用する機能や、作業中のバックアップを書き出す機能もあります。動作には、Windowsと.NET 6.0が必要です。

## 中国語のコミュニティ

中国語のコミュニティは、百度貼吧に集まっています。

[口袋改版资源吧](https://tieba.baidu.com/f?kw=%E5%8F%A3%E8%A2%8B%E6%94%B9%E7%89%88%E8%B5%84%E6%BA%90)は、ページの表示によると、関注者が26.1万人、投稿数が164.5万件です。上部のタブには、精華、人気、最新、吧友互助(コミュニティ内の助け合い)、画像と文章の攻略、汉化発布、改版発布、改版教程があります。固定された投稿は、2021年3月26日付の「本吧資源導航」で、ゲームのファイル、攻略、秘籍、エミュレーター、チートコード、補助ツール、改造の教程、ツール、素材などを集めた目次とされています。

![口袋改版资源吧のトップページ](../assets/screenshots/tieba-pokemon-hack-resource-bar.jpg)

[口袋妖怪改版吧](https://tieba.baidu.com/f?kw=%E5%8F%A3%E8%A2%8B%E5%A6%96%E6%80%AA%E6%94%B9%E7%89%88)は、関注者が4.9万人、投稿数が12.7万件で、2012年3月に作られました。タブには、NDSの教程、GBAの教程、資源のダウンロード、動画があります。掲げているスローガンは「改版技術是未来活跃的源泉」(改造の技術が、これから活発になる源泉)です。

![口袋妖怪改版吧のトップページ](../assets/screenshots/tieba-pokemon-hack-bar.jpg)

口袋改版资源吧に載っていた改版の一例が、「宝可梦 水银」です。投稿の声明によると、ファイアレッドをもとに作った非営利のROM hackで、物語と内容は、金銀水晶とハートゴールド・ソウルシルバーをもとにした二次創作とされています。ポケモンのシリーズに関する権利は、任天堂などに属すると、声明にも書かれています。

## 注意点

パッチを当て済みのROMを配る配布サイトも存在するようです。原作のROMの再配布にあたり、権利の面で問題があります。パッチ(差分のファイル)だけを入手し、自分で用意した原作のROMに適用するのが安全です。この調査では、ROMとパッチの配布先のリンクは記録していません。
