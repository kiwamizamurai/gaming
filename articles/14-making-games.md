# 自作ゲームを作る方法とオープンソースのツール

携帯機で遊ぶ自作ゲームは、機種ごとに作り方が違います。この記事では、ゲームボーイ、ゲームボーイアドバンス、Linux系の携帯機の三つに分けて、プログラミングの方法とオープンソースのツールを整理します。出典は公式のページです。作ったゲームの配布先は [自分で用意するデータと権利のないゲーム](13-own-data-and-free-games.md) にあります。

## コードを書かずに作る

プログラミングの経験がなくても、ゲームボーイのゲームは作れます。[GB Studio](https://www.gbstudio.dev/)は、ドラッグ&ドロップで作るゲーム制作ツールです。公式のページによると、見下ろし型、プラットフォーム型、シューティングなどを作れ、音楽の編集機能も内蔵しています。完成したゲームは本物のROMファイルとして書き出せるので、ゲームボーイのエミュレーターで遊べます。ブラウザ用の書き出しもあり、itch.ioへの公開も可能です。対応OSはWindows、Mac、Linuxです。ソースコードは[GitHub](https://github.com/chrismaltby/gb-studio)にあり、ライセンスはMITと確認できました。

![GB Studioの公式サイト](../assets/screenshots/gb-studio-home.jpg)

## ゲームボーイをCやアセンブリで作る

コミュニティの[gbdev.io](https://gbdev.io/)は、ゲームボーイの開発に取り組む非営利の集まりです。技術資料のPan Docs、資料集のawesome-gbdev、アセンブラのRGBDS、CコンパイラのGBDK 2020などを運営しています。[資料の一覧ページ](https://gbdev.io/resources.html)は、道具を種類ごとに紹介しています。

アセンブラでは、[RGBDS](https://github.com/gbdev/rgbds)が、ゲームボーイとゲームボーイカラー向けの標準的な開発ツールと位置づけられています。ライセンスはMITです。ブラウザ上で試せるRGBDS-Liveもあります。学習用には、アセンブリで作るチュートリアル「GB ASM Tutorial」が向いています。Hello Worldから始めてアルカノイド風のゲームを作り、最後にシューティングを仕上げる構成です。

Cで書くなら、[GBDK 2020](https://github.com/gbdk-2020/gbdk-2020)です。メンテナンスされているGBDKで、SDCCのツールチェーンを使い、Cコンパイラ、アセンブラ、リンカー、ライブラリを提供します。ライセンスは、GitHubの自動判定では種類を特定できないため、リポジトリのLICENSEで確認してください。GBDKの上に作るエンジンとして、ZGBとRetr0 GBが紹介されています。

画像と音の道具も、公開されています。タイルを編集するTilemap Studio、サウンドドライバーのDevSoundX、音楽を作るhUGETrackerなどです。動作の確認には、mGBA、SameBoy、Emulicious、BGBなどのエミュレーターを使います。Emuliciousは、VS Codeからソースを見ながらデバッグできると紹介されています。

完成したゲームは、実機のフラッシュカートに書き込んでも遊べます。[吸い出しの記事](13-own-data-and-free-games.md)で紹介した GBxCart RW と FlashGBX が、書き込みにも使えます。

## ゲームボーイアドバンスを作る

GBAは、[gbadev.net](https://gbadev.net/)が、コミュニティの拠点です。[導入のガイド](https://gbadev.net/getting-started.html)は、道筋を三つに分けています。

![gbadevの導入ガイド](../assets/screenshots/gbadev-getting-started.jpg)

高水準の道は、ゲームを作ることを優先する人向けです。ガイドは、UnityやGodotのようなPC向けのエンジンはなく、C#、Python、Javaも使えないと書いています。おすすめは、C++のライブラリの[Butano](https://github.com/GValiente/butano)で、ライセンスはZlibです。Luaで書くBPCore-Engineもあります。

低水準の道は、I/Oレジスタを直接扱う人向けです。ガイドが最も人気とするのは、devkitARMとlibtoncの組み合わせで、チュートリアルの「Tonc」は現在で最も良い教材とされています。ほかに、NimのNatuやRustのagbも紹介されています。ツールチェーンには、CMakeを使うgba-toolchainと、Mesonを使うmeson-gbaも選べる、という案内です。2003年が最後のリリースのDevKit Advanceは、古すぎるため使わないよう警告されています。ライブラリなしで一から作る道もありますが、助けを得にくいので、慣れた人向けです。

エミュレーターは、NanoBoyAdvance、mGBA、no$gbaが推奨されています。NanoBoyAdvanceは最も正確ですが、デバッグ機能がありません。GitHubのリポジトリは、2026年6月21日の更新を最後にアーカイブされました。mGBAにはGDBをつなげるので、PCのプログラムのようにデバッグできます。no$gbaは正確さで劣るものの、優れたデバッガーを持っています。

## Linux系の携帯機に作る

ROCKNIX、Knulli、muOSなどのLinux系OSでは、PortMasterの仕組みを使います。[PortMasterの開発ページ](https://portmaster.games/porting.html)は、対応するゲームを5種類に分けています。GitHubなどのオープンソースのゲームをコンパイルして包むもの、一から作られたオープンソースのエンジン、GameMakerやGodot、LÖVEのような、元のデータが必要なエンジン、そしてBox86とBox64でx86のLinuxゲームを動かすものです。

![PortMasterの開発ページ](../assets/screenshots/portmaster-porting.jpg)

制約は大きいです。同じページは、多くのOSには完全なOpenGLがなく、X11もWestonもないと書いています。RockchipのAnbernic機は、古い3.x系のカーネルと、Mali用の独自ドライバーを使うため、使えるのはOpenGL ESだけです。OpenGL 2.x相当の機能は、GL4ESという変換のライブラリで補います。出力は、KMS/DRMかSDL2になり、VulkanとX11は使えません。

作る側から見て使いやすいのは、公式の実行環境が用意された道具です。SDL 1.2はsdl12-compatで変換できます。Godot 3は、FRTというエクスポートテンプレートで動かします。FRTではジョイスティックの処理が無効なので、操作の割り当てはgptokeybの担当です。LÖVEには、バージョンごとのaarch64版があります。Godot 4、Java、LibGDX、SFML、SDL3、Allegroは、WestonPackというランタイムの対象です。Javaの例として、Minecraft用のランチャーやUncivが挙げられています。

コントローラーの操作は、gptokebyでキーボードやマウスに割り当てます。`./gptokeyb "application" -c mykeymaps.gptk` のように呼び出し、STARTとSELECTでの終了にも対応します。開発中は、SSHで機器に入って試すことが勧められています。その際はフロントエンドを止めます。ROCKNIXでは `systemctl stop essway.service`、Knulliでは `/etc/init.d/S31emulationstation stop` が使えます。完成後は、同じサイトの[パッケージのガイド](https://portmaster.games/packaging.html)に沿って、ポートの形に整えます。

LÖVEを使う場合、KMS/DRMにはマウスカーソルがないため、ゲームごとに、ソフトウェアで描くカーソルを入れる必要があると、同じページに説明があります。

## 学べること

ゲームボーイは、CPUとメモリの仕組みを少ない命令で学べる教材です。Pan DocsとGB ASM Tutorialがそろい、エミュレーターのデバッガーで動作を確認できます。GBAでは、devkitARMとlibtoncを使い、I/Oレジスタを直接扱う練習ができます。Linux系の携帯機なら、SSHで入ってビルドし、グラフィックスAPIの制約に合わせる経験になります。移植の作業は、OpenGL ESとKMS/DRMの違いを学ぶ入り口にもなります。
