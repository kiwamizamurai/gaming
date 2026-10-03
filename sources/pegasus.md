# Pegasusの公式資料

種類は、フロントエンドPegasusのREADMEとドキュメントです。URLは、READMEが https://github.com/mmatyas/pegasus-frontend 、ドキュメントのソースが https://github.com/mmatyas/pegasus-docs です。公開サイトの https://pegasus-frontend.org は、この調査のブラウザでは読み取れませんでした。信頼度は公式です。

## README

Pegasusを、ゲームのライブラリを閲覧して、さまざまなエミュレーターを同じ場所から起動するためのフロントエンドと説明しています。特徴は、オープンソースと複数のプラットフォーム(Windows、Linux、Mac、Android、各種のRaspberry Pi、Odroid)、UIを完全に変えられるテーマ(ユーザーのシェーダーも使える)、EmulationStationのgamelistファイルとの互換性、ゲームパッドの対応、複数のアスペクト比への対応、ポータブルモード、テーマのライブ再読み込みです。ライセンスはGPLv3で、含まれる製品のロゴなどは、商用利用に別の許可が必要な場合があります。ビルドには、C++11のコンパイラ、Qt 5.15.0以降(QML、Multimedia、SVG、SQL)、SDLまたはQt Gamepadが必要です。

## メタデータファイル

[meta-files.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-files.md)は、`metadata.pegasus.txt`(または `metadata.txt`)の書式を説明しています。ファイルは `名前: 値` の並びで、複数行の値は、2行目以降を空白かタブで始めます。`#` で始まる行はコメントです。コレクション(機種などの分類)には、`collection`(必須)、`launch`(共通の起動コマンド)、`workdir`、`extension`、`file`、`regex`、`directory`、`ignore-extension`、`ignore-file`、`ignore-regex`、`shortname`、`sort-by`、`summary`、`description` を使えます。ゲームには、`game`(必須)、`file`、`developer`、`publisher`、`genre`、`tag`、`summary`、`description`、`slug`、`players`、`release`、`rating`、`launch`、`workdir` を使えます。`x-` で始まる名前は、スクレイパーなどのソフトウェアが、独自のデータを書き込むために使えます。

起動コマンドで使える変数は、`{file.path}`、`{file.uri}`、`{file.name}`、`{file.basename}`、`{file.dir}`、`{env.変数名}` です。Androidでは、アプリによって直接のファイルパスを求めるものと、content URIを求めるものがあるため、`{file.path}` と `{file.uri}` を使い分けます。Android 11以降は、アプリのファイルアクセスが制限され、ディレクトリごとの権限が必要になることがあります。

## アセットとAndroid

[meta-assets.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/meta-assets.md)は、カバーやロゴ、動画などの探し方を説明しています。優先順位は、メタデータファイルでゲームごとに指定したもの、コレクションの既定として指定したもの、`<フォルダ>/media/<ゲーム名>/` の中の決まった名前のファイル、第三者のデータソースの順です。大量のゲームには、Universal XML Scraper、Steven Selph's Scraper、Skraper.net、Skyscraperなどのスクレイパーを使えると紹介されています。

[platform-android.md](https://github.com/mmatyas/pegasus-docs/blob/master/docs/user-guide/platform-android.md)は、Android 5.0以降で動くこと、APKとして配布されること、設定のフォルダが `<ストレージ>/pegasus-frontend` であることを書いています。ランチャーの既定にできます。ほかのアプリを起動するときは、Activity Managerの `am start` を使い、`android.intent.action.VIEW` でファイルを開く例が載っています。
