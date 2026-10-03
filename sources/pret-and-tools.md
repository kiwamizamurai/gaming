# pretとポケモン改造のツール

種類は、GitHubの各リポジトリのREADMEとINSTALLの文書です。信頼度は公式(各プロジェクト自身の資料)です。この調査では、`gh` コマンドで内容を読みました。

## pret

pretの各プロジェクトのREADMEは、短く、何をビルドするかと、確認用のSHA1を書いています。

[pokeemerald](https://github.com/pret/pokeemerald)は、ポケモンエメラルドの逆コンパイルで、`pokeemerald.gba` を作ります。[pokefirered](https://github.com/pret/pokefirered)は、英語版のファイアレッドとリーフグリーンの逆コンパイルで、通常版、rev1、Switch版の6種類のROMを作ります。[pokecrystal](https://github.com/pret/pokecrystal)は、クリスタルの逆アセンブルで、複数のバージョンのROMを作ります。FAQ、ドキュメント、Wiki、チュートリアル、シンボル、ツール(gb-asm-tools)への案内があり、質問はDiscordで受け付けています。[pokered](https://github.com/pret/pokered)は、赤と青の逆アセンブルです。連絡先とほかのプロジェクトは、[pret.github.io](https://pret.github.io/)にあります。

[pokeemeraldのINSTALL.md](https://github.com/pret/pokeemerald/blob/HEAD/INSTALL.md)は、ビルド環境を作る手順です。Windowsには、WSL1(推奨で最速)、msys2(約2倍遅い)、Cygwin(約5〜6倍遅い)の3つの方法があります。WSL2は、ファイルをWSL2側に置けば、WSL1より速い場合があります。ただし、Qt 5.15.2より前のバージョンを使うPorymapなどは、WSL2のネットワークドライブのパスで問題を起こすことがあります。WSL1では、Ubuntuに `build-essential`、`binutils-arm-none-eabi`、`git`、`libpng-dev` を入れます。Windows 7と8の手順は、サポートが終わったOSのため、今後壊れても、直るのが遅いと断り書きがあります。

## pokeemerald-expansion

[pokeemerald-expansion](https://github.com/rh-hideout/pokeemerald-expansion)は、pretのpokeemeraldの上に作られた、ROM hackの基盤です。READMEは、「これ自体は遊べるポケモンのゲームではない」と明記しています。シリーズの何百もの機能と、遊びやすさを上げる機能を備えます。使うときは、RHH(Rom Hacking Hideout)をクレジットとして書くよう求め、例文を載せています。公式のゲームとは通信できないため、公式との互換性が必要ならpret側を使うよう案内しています。GitHubの「Download Zip」では、コミット履歴が付かず、更新や機能ブランチの統合ができないため使わないよう、注意書きがあります。ドキュメントは https://rh-hideout.github.io/pokeemerald-expansion/ にあり、質問はRHHのDiscordです。

## Porymap

[Porymap](https://github.com/huderlem/porymap)は、pokeruby、pokeemerald、pokefireredの地図エディタです。ライセンスはLGPL-3.0です。[公式のガイド](https://huderlem.github.io/porymap/)があり、WindowsとmacOSには配布のビルドがあります。Linuxでは、ソースからビルドするか、FlathubやAURのような外部のパッケージ管理を使います。

## HexManiacAdvance

[HexManiacAdvance](https://github.com/haven1433/HexManiacAdvance)は、ポケモンのGBA作品のためのエディタです。対象は、英語版のRuby、Sapphire、FireRed、LeafGreen、Emeraldで、ほかのファイルを開いたときは、機能が減ります。データ(ポケモン、トレーナー、技、アイテム、各種の定数)、地図(地図、イベント、接続、ワープ)、テキスト(元の場所に収まらないテキストの再配置を自動で行う)、画像(PNGとの変換、パレットの管理)、コード(XSEに近いイベントスクリプトと、技の効果とトレーナーAIなどのスクリプト、thumbコード)を編集できます。IPSとUPSのパッチの作成と適用、図鑑の並べ替え、バックアップの書き出しもできます。ライセンスはMITで、Windowsと.NET 6.0が必要です。
