# examples

自作ゲームの最小の例です。どちらも、[自作ゲームを作る方法](../articles/14-making-games.md)の記事で、作り方と動作の確認を説明しています。

[love2d-coin](love2d-coin)は、LÖVE 11.5で動くコイン集めです。ROMは要りません。`love examples/love2d-coin`で起動します。

[gbdk-coin](gbdk-coin)は、GBDK-2020 4.5.0でビルドするゲームボーイのROMです。`make GBDK_HOME=$HOME/gbdk`で`coin.gb`ができます。GBDKは、パスの短い場所に置いてください。

[love2d-coin-plus](love2d-coin-plus)は、LÖVE版に、タイルの絵、壁のあるマップ、効果音、最高点の保存を足した発展版です。絵と効果音は`make_assets.py`が生成します。`love examples/love2d-coin-plus`で起動します。

[gbdk-coin-plus](gbdk-coin-plus)は、GBDK版の発展版です。タイルの絵、壁のあるマップ、効果音、バッテリー付きRAMへの最高点の保存を足してあります。`make GBDK_HOME=$HOME/gbdk`で`coin_plus.gb`ができます。

[rea-lab](rea-lab)は、[記事22](../articles/22-rea-hands-on.md)から[記事24](../articles/24-android-nova.md)で使ったファイルです。コイン集めのC言語版、Python版、C#版(2つの版)、JavaScript版(2つの版)、LÖVE版と、Ghidraのスクリプト、LÖVEのAndroid版のAPKをREAで読む手順が入っています。詳しくは[rea-lab/README.md](rea-lab/README.md)にまとめました。
