# フロントエンドと天馬G

フロントエンドは、ゲームの一覧を表示して、選んだゲームを対応するエミュレーターで起動するアプリです。中国の出品でよく見かける「天馬G」も、フロントエンドの一種です。この記事では、元になったPegasusの仕組みから順に、天馬Gの構造と導入の流れを整理します。

## Pegasus

Pegasusは、ゲームのコレクションを閲覧して、さまざまなエミュレーターを同じ場所から起動するためのグラフィカルなフロントエンドです。[公式のREADME](https://github.com/mmatyas/pegasus-frontend)は、カスタマイズ性、複数のプラットフォームへの対応、高い性能を特徴に挙げています。Windows、Linux、Mac、Android、Raspberry Pi、Odroidで動き、ライセンスはGPLv3です。テーマで画面の見た目を変えられ、EmulationStationのgamelistファイルも使えます。

Pegasusの方針は、公式の入門ページに書かれています。ゲーム、エミュレーター、ゲームのデータや画像のどれも、Pegasus自身は同梱もダウンロードもしません。そのかわり、利用者が自分で用意したものを自由に組み合わせられます。ほかの外部ツールで足りる機能は取り込まず、組み合わせて使う設計です([Getting started](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/getting-started.md))。

この方針は、中国の出品を読むときにも関係します。Pegasus本体は画面と起動の役目だけを持つので、動作の良し悪しは、組み合わせるエミュレーターと設定で決まります。ゲームのパックを付けたものを「Pegasusの機能」と見なすことはできません。

入門ページが挙げる公式のリリース対象は、Windows 7以降、Ubuntu 18.04かDebian Buster以降のLinux、Raspbian Buster以降のRaspberry Pi、Ubuntu 18.04以降のOdroid、Android 5以降、macOS 10.13以降です。リリースには、最新の修正を含む「latest」と、公開から数週間たって問題が出ていない「stable」の2つの系統があります。AndroidはAPKで配るため、設定の「提供元不明のアプリ」を許可してからファイル管理アプリで開く手順です。初回の起動では、ゲームを見つけるために、ストレージへの権限を求められます([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/getting-started.md))。

## 画面の操作と設定

Pegasusの操作は、キーボード、ゲームパッド、マウス、タッチのどれでもできます。メインメニューは、Escキー、ゲームパッドのBまたは丸のボタンで開き、画面の右端からメニューを引き出す方法もあります([Getting started](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/getting-started.md))。

既定の割り当ては、公式の操作表にまとまっています。決定はEnterキーかゲームパッドのA(または×)、戻るはEscキーかB(または○)です。ゲームの詳細はIキーかX(または□)、絞り込みと検索はFキーかY(または△)に割り当てられています。L1とR1は、前後のコレクションへの切り替えです。L2とR2は、ゲーム一覧を1ページずつ進めます。キーボードなら、Altキーと文字キーで、その文字から始まるゲームに移動できます([Default controls](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/controls.md))。

設定画面では、表示言語や全画面のオンオフ、テーマの選択ができます。ゲームを探す動作は、設定の「Gaming」にある2つの項目で決めます。1つは「Set game directories」で、メタデータファイルを探すフォルダの一覧を編集する項目です。もう1つは「Enable/disable data sources」で、ほかのソフトのゲーム一覧を取り込むかどうかを切り替えます([Getting started](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/getting-started.md))。

![Pegasusのスクリーンショット。出典はPegasusのリポジトリ](https://raw.githubusercontent.com/mmatyas/pegasus-frontend/master/etc/promo/screenshot_alpha10.jpg)

## メタデータファイルとアセット

Pegasusは、ゲームの一覧と起動方法を、`metadata.pegasus.txt` というテキストファイルで管理します。[公式のドキュメント](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-files.md)によると、このファイルは `名前: 値` の形式です。書くグループは、コレクションとゲームの2種類を書きます。

コレクションは、機種などの分類です。`collection` でコレクションの名前を決め、`extension` で対象にする拡張子、`launch` で共通の起動コマンドを指定します。ゲームは、`game` で表示名を決め、`file` でファイル名、`developer` で開発元を書く形です。ゲームごとに起動コマンドを変えるなら、そのゲームに `launch` を書く方法もあります。ファイルを含める条件は `extension`、`file`、`regex`、`directory` で指定でき、除外する条件は先頭に `ignore-` を付けた同じ名前で指定する仕組みです。除外は、含める条件より優先されます。

起動コマンドの中では、`{file.path}` のような変数を使えます。`{file.path}` はゲームのファイルの絶対パス、`{file.name}` はファイル名、`{file.basename}` は拡張子を除いたファイル名、`{file.dir}` はそのファイルがあるフォルダです。

メタデータファイルの書式には、細かい決まりがあります。名前の大文字と小文字は区別されません。値は複数行にでき、2行目以降は空白かタブで始める決まりです。`#` で始まる行はコメントで、空行は無視されます。説明文の中では、点だけの行が段落の区切りです。ファイルの名前は `metadata.pegasus.txt` が基本で、これがなければ `metadata.txt` を探します。`MarioGames.metadata.pegasus.txt` のように拡張子の前に名前を付ければ、同じフォルダに複数のファイルを置けます。また、設定フォルダの `metafiles` に置けば、ゲームとは別の場所でまとめて管理できます([meta-files.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-files.md))。

同じ名前のコレクションは、複数のメタデータファイルにまたがって1つにまとまります。1つのゲームを、複数のコレクションに入れることも可能です。コレクションの `shortname` は、テーマがロゴなどの画像を探すときの手がかりに使われます。公式の表では、ゲームボーイアドバンスが `gba`、PlayStationが `psx`、PlayStation Portableが `psp`、Nintendo 64が `n64`、Sega Dreamcastが `dreamcast` となっています([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-files.md))。

ゲームの項目には、`developer`、`publisher`、`genre`、`players`、`release`、`rating` などの情報も書けます。`players` は `2` や `1-4` の形、`release` は `1985-05-22` の形で、月や日が不明なら省略できます。`rating` は `70%` か `0.7` の形です。ゲームが一覧に出る条件は、少なくとも1つのコレクションに属し、実在するファイルを1つ以上持つことです([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-files.md))。

公式の例では、スーパーファミコンのゲームを `C:/games/snes` に置き、そこに `metadata.pegasus.txt` を作ります。`extensions` に `smc, sfc` などの拡張子を並べ、`launch` に `snes9x "{file.path}"` と書くだけです。その後、設定でこのフォルダを検索対象に加えれば、次の起動から一覧に出ます。`regex` を使うと、`\d+.in.1` のような名前の規則で、ゲームを別のコレクションに集めることもできます([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-files.md))。

カバー画像や動画は、`assets.box_front` のように、ゲームごとに指定できます。指定しなかった場合、Pegasusは、ゲームのフォルダの `media/<ゲーム名>/` の中から、`boxFront`、`logo`、`video` などの決まった名前のファイルを探します。画像はPNGとJPG、動画はWEBMとMP4とAVIが対象です([ドキュメント](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-assets.md))。

画像や動画の探し方には、優先順位があります。1番目はメタデータでゲームごとに指定したファイルです。2番目はコレクションの既定として指定したファイル、3番目は `<フォルダ>/media/<ゲーム名>/` の中の決まった名前のファイル、4番目はEmulationStationやSteamなど第三者のデータです。コレクションの既定の画像を使うかどうかは、テーマの作者が決めます([meta-assets.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-assets.md))。

`<ゲーム名>` の部分は、ゲームのタイトルでも、ファイル名から拡張子を除いたものでも構いません。認識される名前には、箱の表の `boxFront`、ロゴの `logo`、カートリッジやディスクの `cartridge` と `disc`、背景の `background`、スクリーンショットの `screenshot`、動画の `video` などがあります。音声はMP3、OGG、WAVを探します([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-assets.md))。

大量のゲームの画像を自分で集めるのは大変です。公式のドキュメントは、スクレイパーと呼ぶソフトの利用を勧めています。例として、Universal XML Scraper、Steven Selph's Scraper、Skraper.net、Skyscraperの4つが紹介されています([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-assets.md))。Skraperが作る `media` フォルダの構成は、Pegasusが直接読めます。`box2dfront` や `videos` といったフォルダに、ゲームのファイル名と同じ名前で画像や動画を置く形です([Other data sources](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-sources.md))。

## ほかのソフトのデータを使う

Pegasusは、メタデータファイルを書かなくても、ほかのソフトのゲーム一覧を取り込めます。公式のドキュメントが挙げる取り込み元は、Steam、GOG、Androidのアプリ、Lutris、EmulationStation、LaunchBox、Skraperの画像です。Androidのアプリは、インストール済みで起動できるものが、ほかのランチャーと同じように並びます。ネットワークにつながっていれば、Google Playから情報と画像も取得します([Other data sources](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-sources.md))。

この記事の主題に近いのは、EmulationStationとの互換性です。EmulationStationが入っていれば、Pegasusは `es_systems.cfg` に書かれたフォルダを調べ、その中の `gamelist.xml` の情報と画像を使います。ただし、EmulationStationには互いに互換性のない派生版が多く、Pegasusが対応するのは、公式の最後のリリースだけです。変換ツールも用意されていて、`metadata.pegasus.txt` は、機種の情報を持つ `es_systems.cfg` と、ゲームの情報を持つ `gamelist.xml` を合わせたものに近い、と説明されています([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-sources.md))。

## 設定の場所、テーマ、スクリプト

Pegasusの設定ファイルは、機種ごとに決まった場所に置かれます。公式の一覧では、Linuxが `~/.config/pegasus-frontend/`、Windowsが `C:\Users\[username]\AppData\Local\pegasus-frontend\`、macOSが `~/Library/Preferences/pegasus-frontend/` です。Androidは `<storage>/Android/data/org.pegasus_frontend.android/files/pegasus-frontend/` と書かれ、プログラムと同じ場所の `config` フォルダは全機種で使えます([Configuration directories](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/config-dirs.md))。なお、Androidのプラットフォーム別の注意では、設定フォルダは `<ストレージ>/pegasus-frontend` で、内蔵ストレージがなければSDカードになると説明されています。2つの記述が食い違う理由は、確認できませんでした([platform-android.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md))。

`--portable` を付けて起動するか、実行ファイルの隣に `portable.txt` を置くと、ポータブルモードになります。この場合、Pegasusは自分のフォルダの中にだけ書き込もうとするので、USBメモリなどへの持ち運びが楽になります。Linuxでは、USBドライブやNTFSからプログラムを実行できないことがある、という注意も書かれています([Portable mode](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/portable.md))。

テーマは、設定フォルダの `themes` に、テーマのフォルダごと解凍して入れ、設定画面から選びます。フォルダがなければ手動で作ります([Installing themes](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/installing-themes.md))。さらに、設定フォルダに `scripts` を作り、その下にイベント名のフォルダを置く仕組みもあります。イベントには、`game-start`(ゲームの開始前)、`game-end`(ゲームの終了後)、`quit`、`reboot`、`shutdown` などがあり、中の実行ファイルはアルファベット順に呼ばれます([Scripting](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/scripting.md))。

## Androidでの起動

Androidでは、ほかのアプリの起動方法が、パソコンとは違います。公式のドキュメントによると、プログラムを直接呼び出す代わりに、Activity Managerの `am start` で、ファイルを開くアプリを指定します([Android向けの注意](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md))。Android 11以降は、アプリのファイルアクセスが制限されるため、ほかのアプリがゲームのフォルダを読めるよう、あらかじめ権限を与える必要がある場合があります。

具体的な書き方は、公式の例にあります。ファイルを既定のアプリで開くなら、`am start --user 0 -a android.intent.action.VIEW -d {file.path}` の形です。`--user 0` は、これを付けないと権限エラーが出た、という筆者の注記つきの指定です。特定のアプリで開きたいときは、`-n` でアプリのActivity名を指定します。PPSSPPなら `org.ppsspp.ppsspp/.PpssppActivity` です。Activity名は、アプリの `AndroidManifest.xml` を読むか、開発者に聞いて調べるしかない、と説明されています([platform-android.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md))。

ファイルを直接開けないアプリもあります。公式のドキュメントは、RetroArchをその例に挙げています。起動には、`-e ROM`、`-e LIBRETRO`、`-e CONFIGFILE` のような独自の引数を、多く使う形です。`LIBRETRO` にはコアのファイルのパス、`CONFIGFILE` には設定ファイルのパスを指定するので、自分の機種の保存先に合わせて書き換える必要があります。内蔵ストレージのパスも、機種によって異なる点に注意が必要です([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md))。公式は、起動コマンドを作るオンラインのツールも案内しています。

ファイルを開ける既知のエミュレーターの一覧には、Dolphin(`org.dolphinemu.dolphinemu/.activities.AppLinkActivity`)、PPSSPP、DraSticなどがあります。一方、Citraは「対応なし」、ePSXeは「直接は不可で回避策あり」という記載です。リストは不完全と断ってあり、書かれた時点の情報です([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md))。そのほかの注意として、動画の再生は電池の消費が大きく、メモリを多く使うアプリを起動するとAndroidがPegasusを終了させることがあり、再起動と電源オフはAndroidの制限でできません([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md))。

Pegasusをホーム画面のアプリ(既定のランチャー)に設定すれば、端末の起動と同時にPegasusが始まります。元に戻すには、Androidの設定の「既定のアプリ」から選び直します([同上](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md))。公式の例では、SDカードの `Roms/NES` と `Roms/PSP` の2つのフォルダにそれぞれメタデータファイルを置き、NESはRetroArchのコア、PSPは単体のPPSSPPで起動します([Android example setup](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android-example.md))。

## EmulationStation系の考え方

Pegasusのほかに、携帯機のカスタムファームウェアで広く使われるフロントエンドが、EmulationStationです。Knulliの公式ドキュメントによると、Knulliの既定のフロントエンドはEmulationStationで、既定のテーマはArt Book Nextです。CarbonとKnulliのテーマも同梱され、3つともリリースごとに更新されます([Themes](https://github.com/knulli-cfw/knulli.org/blob/main/docs/configure/customization/themes.md))。ROCKNIXの機種ページも、メインラインLinuxの上でSwayとEmulationStationを使うと書いています([ROCKNIX Retroid Pocket 5](https://rocknix.org/devices/retroid/retroid-pocket-5/))。

EmulationStation系のOSは、Pegasusと考え方が違います。Pegasusは、エミュレーターの起動コマンドを利用者が書きます。Knulliは、各エミュレーターの設定を、EmulationStationの画面から行う方式です。ゲームを起動するたび、エミュレーター固有の設定ファイルはすべて消されて、EmulationStationでの設定から作り直されます。そのため、RetroArchの画面で変えた設定は、次の起動で失われます([Game Settings](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/game-settings.md))。

設定には階層があります。上から順に、Knulliの既定、全体の設定、機種ごとの設定、ゲームごとの設定です。多くの項目は「auto」になっていて、1つ上の階層の値を引き継ぎます。変えたいときは、できるだけ下の階層で変えるのが公式の勧めです。たとえば、特定の1本だけに効かせたいなら、そのゲームの設定で変えます。機種ごとの設定は、ゲーム一覧で「Select」を押して開き、ゲームごとの設定は、起動のボタンを長押しして開きます([同上](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/game-settings.md))。

エミュレーターの切り替えは、機種ごとの階層とゲームごとの階層だけでできます。全体の階層で選べないのは、すべての機種を1つでまかなえるエミュレーターがないためです。Knulliは、機種ごとに、多くのゲームと低性能の携帯機に向く既定のエミュレーターを選んでいます。ゲームの動作がおかしければ、別のエミュレーターに替える方法を試すよう勧めています。公式は、N64のように再現が難しい機種では、ゲームによって向くエミュレーターが違うと書いています([同上](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/game-settings.md))。

エミュレーターには、RetroArchの「コア」と、単体のエミュレーターの2種類があります。単体のエミュレーターの多くは、オートセーブとロードに対応せず、セーブデータの画像も付かず、セーブをEmulationStationの画面に出せないものもあります。公式の例では、N64のMupen64plus: Riceを使うと、状態のセーブとロードはできても、その記録がEmulationStationには表示されません([同上](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/game-settings.md))。

画像や説明の付け方も、Pegasusと違います。Knulliには、ScreenScraper、TheGamesDB、ArcadeDBから情報を取る内蔵のスクレイパーがあり、既定はScreenScraperです。ScreenScraperを使うにはアカウントへのログインが必要です。スクレイパーは、ROMのファイル名をもとにゲームを探すので、名前が整っていないと見つけられません。地域の表記(`(U)` など)があれば、それも手がかりになります。他の機種で作った `gamelist.xml` と画像のフォルダをそのまま移せば、スクレイプし直さずに使えます。表示されないときは、「Update gamelists」を実行します([Scraping](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/scraping.md))。

EmulationStationの「コレクション」には、3つの種類があります。直近に遊んだゲームなどを自動で集める「自動」、利用者がゲームを1本ずつ追加する「編集可能」、ジャンルなどの条件で自動的に集める「動的」です。Knulliには、遊びたいゲームを積んでおく「Now Playing」というコレクションの使い方も案内されています([Collections](https://github.com/knulli-cfw/knulli.org/blob/main/docs/configure/collections.md))。

電源を切るときの扱いも、設定で変えられます。「Quick Resume Mode」と「Auto Save/Load」を有効にすると、電源を落とす時点の進行が自動で保存され、次の起動では最後のゲームがそのまま始まる設定です。公式の説明では、携帯機のスリープは電池の消費が大きいので、長時間の維持には頼らず、電源を落とす使い方が勧められています。エミュレーターによってはオートセーブに対応しないため、その場合は自分でセーブする必要があります([Quick Resume](https://github.com/knulli-cfw/knulli.org/blob/main/docs/configure/quick-resume.md))。


## 天馬Gとは

天馬Gは、Pegasusを中国語化して、ゲームのパックを付けたものです。知乎に転載された什么值得买の紹介記事は、PegasusをもとにしたGの前端を、中国のコミュニティ「跳坑者联盟」が汉化(中国語化)し、汉化したゲームのパックも作った、と説明しています([模拟器游戏 篇四](https://zhuanlan.zhihu.com/p/703325151))。記事によると、パックはGBA、NDS、3DS、PSP、PS1、PS2、Wii、アーケードなどを含み、総量は約2.8TBです。ストレージの容量に合わせて内容を選べて、記事が使ったのは220GBの精簡版でした。ゲームごとに、カバー、名前、紹介動画が付き、テーマも8種類が内蔵されています。

構造は、CSDNの記事が整理しています。前端はPegasusで、カバーの壁とメニューの表示が役割です。実際にゲームを動かすのは、RetroArchや単体のエミュレーターのAPKです。そして、ROM、BIOS、カバー画像、動画、中国語のメタデータが、資源の層です([天马G前端的使用](https://blog.csdn.net/fanged/article/details/152960565))。この記事の筆者が、Android版のPegasusのソースを読んだところ、AndroidでエミュレーターのAPKを起動する処理は、`am start` に相当するIntentの呼び出しを組み立てて、JNIから `startActivity` を実行するだけでした。天馬Gが提供するのは、ゲームの管理と起動のためのUIです。

知乎の記事は、闲鱼で、この天馬Gのパックを20元程度で売る商家がいると書いています。パックの入手が簡単な分、出品の価値は、手間賃にあたる部分が大きいと考えられます。

2020年の百度貼吧の投稿にも、同じ前端の紹介が見つかりました。投稿者は、手元のゲームのROMを、リストから選んで起動したいという動機から、このPC用のフロントエンドを使い始めたと書き、検索するときの名前は「天马模拟器前端」だそうです。パックの大きさは、当時で約15GBでした([给大家分享一个PC上的模拟器前端](https://tieba.baidu.com/p/6671136635))。

## PC版の導入

知乎の記事は、PC版の導入を3段階に分けています。1つ目は、エミュレーター本体の導入です。ダウンロードしたフォルダの「安装包」から、環境に合うアーカイブを選び、ドライブの一番上のフォルダに解凍します。一番上でないと、エミュレーターが正しく動きません。解凍すると「Pegasus G」というフォルダができます。起動時に落ちるのを防ぐために、「解決閃退工具」フォルダの映像プラグインも入れます。

2つ目は、ゲームのROMの配置です。パックの `roms` フォルダの中身を、「Pegasus G」の下の `roms` に解凍します。ファイル名は変えてはいけません。天馬Gは、`roms` を自動で走査して、ゲームの名前と紹介を認識します。

3つ目は起動で、天馬Gのランチャーを起動すると、ゲームの一覧が表示されます。記事に書かれた困りごとと解決策は、次のとおりです。音が出ないときは、3DMのゲーム用ランタイムを入れて解決しました。Wiiのゲームが落ちたときは、解決用フォルダの任意のドライバをすべて入れて解決しました。エミュレーターごとにキー操作が違い、PPSSPPでは、Escで設定が開きます。

## Android版の導入

CSDNの記事は、Android版の導入を、APK、設定ファイル、ROMの3段階で書いています。まずAPKとして、天馬G本体、RetroArch、ファイル管理アプリのMT管理器などの導入が最初の手順です。筆者はadbでインストールしました。インストール後は一度起動して、権限を与える流れです。

次に設定ファイルです。天馬Gの主題パックと設定ファイル、それに `Android` フォルダを配置します。Android 11以降は、各アプリのデータフォルダ(`Android/data/<パッケージ名>`)が保護されていて、ファイル管理アプリから書き込めないため、この部分は手動で配置する必要があります。天馬Gは、Pegasus、RetroArch、AetherSX2のような複数のアプリで、設定ファイルとROMのパスを共有するからです。

最後がROMです。ROMのファイルに加えて、天馬Gの画面のために、主画像、副画像、紹介動画、そしてメタデータのファイルを用意し、スマホのルートにある `Roms` フォルダに置きます。「跳坑者联盟」のパックを使う場合は、これらは精簡包の中にあらかじめ用意されています。

筆者は、手元の古いスマホ(Snapdragon 855)で試し、画面の見た目は華やかで、USB接続のコントローラーも遅延なく使えたそうです。一方で、4:3のゲームの左右に黒い帯が入ることが、スマホの欠点でもあるそうです。

## 出品の「預装天馬G」を読むときの注意

CNFansで見つけたRetroid Pocket 5向けの出品の画像には、「预装RP5天马G专用内存卡」と書かれていました。ページの説明には、この商品はメモリカードだけで、手元に届いてから、チュートリアルに従ってインストールすると書かれています。オプションは、Sandisk 128GBから、2TBまでの6種類です([CNFansの検索結果](https://cnfans.com/search?keywords=RP5%E9%A2%84%E8%A3%85%E5%A4%A9%E9%A9%AC&searchType=keywords))。

![CNFansの検索結果。RP5向けの天馬Gの出品が並ぶ](../assets/screenshots/cnfans-search-rp5-tianma.jpg)

![カード単体の出品ページの上部](../assets/screenshots/cnfans-rp5-tianma-card-top.jpg)

![カード単体の出品のオプション](../assets/screenshots/cnfans-rp5-tianma-card-options.jpg)

出品の文面からは、収録されるゲームのタイトル、本数、機種ごとの内訳が分かりませんでした。天馬Gのパックの全体は約2.8TBなので、128GBのカードに入る分は一部です。パックにはROMが含まれ、権利の面で問題がある場合が多いです。出品を購入するときは、収録内容を出品者に確認する必要があります。

## この記事で出てくる中国語

天馬Gの紹介や出品の文面に出てきた語を、本文で触れた順を目安に表へ整理しました。

| 中国語(簡体字) | ピンイン | 日本語の意味 | 出典 |
|---|---|---|---|
| 前端 | qiánduān | フロントエンド。ゲームの一覧を出して起動するアプリ | [知乎の記事](https://zhuanlan.zhihu.com/p/703325151) |
| 汉化 | hànhuà | 中国語化すること | [知乎の記事](https://zhuanlan.zhihu.com/p/703325151) |
| 精简版 | jīngjiǎnbǎn | 内容を減らして容量を小さくした版 | [知乎の記事](https://zhuanlan.zhihu.com/p/703325151) |
| 跳坑者联盟 | tiàokēngzhě liánméng | 天馬Gのパックを作ったコミュニティの名前 | [知乎の記事](https://zhuanlan.zhihu.com/p/703325151) |
| 安装包 | ānzhuāngbāo | インストール用のファイルを入れたフォルダ | [知乎の記事](https://zhuanlan.zhihu.com/p/703325151) |
| 闪退 | shǎntuì | アプリが突然終了すること | [知乎の記事](https://zhuanlan.zhihu.com/p/703325151) |
| 商家 | shāngjiā | 出店者、販売業者 | [知乎の記事](https://zhuanlan.zhihu.com/p/703325151) |
| 闲鱼 | xiányú | 中古品の売買アプリ | [知乎の記事](https://zhuanlan.zhihu.com/p/703325151) |
| 模拟器 | mónǐqì | エミュレーター | [貼吧の投稿](https://tieba.baidu.com/p/6671136635) |
| 预装 | yùzhuāng | あらかじめ入れてあること | [CNFansの出品](https://cnfans.com/search?keywords=RP5%E9%A2%84%E8%A3%85%E5%A4%A9%E9%A9%AC&searchType=keywords) |
| 专用 | zhuānyòng | 専用 | [CNFansの出品](https://cnfans.com/search?keywords=RP5%E9%A2%84%E8%A3%85%E5%A4%A9%E9%A9%AC&searchType=keywords) |
| 内存卡 | nèicúnkǎ | メモリーカード | [CNFansの出品](https://cnfans.com/search?keywords=RP5%E9%A2%84%E8%A3%85%E5%A4%A9%E9%A9%AC&searchType=keywords) |
