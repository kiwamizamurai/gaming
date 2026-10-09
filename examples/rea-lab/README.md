# rea-lab

[記事22](../../articles/22-rea-hands-on.md)から[記事24](../../articles/24-android-nova.md)で使った、実験用のファイルです。どれも、この連載のために自分で書いたものです。実験は、x86_64のUbuntu 24.04で行いました。

| ファイル | 内容 | 使った記事 |
|---|---|---|
| `coin_term.c` | 端末で遊ぶコイン集め(C言語)。`best.sav` に最高点を2バイトで保存する | 記事22、23 |
| `coin_rebuild.py` | 動きの記録だけを見て作り直した、Python版。壁での動きは推測で書いてあり、元とは違う | 記事22 |
| `CoinGame.cs` | .NET(C#)版の1版 | 記事22 |
| `CoinGame2.cs` | 同じゲームの2版。型、引数、名前、機械語ライブラリの呼び出しを、わざと変えてある | 記事22 |
| `coin-js/v1`、`coin-js/v2` | Node.js版の2つの版。2版では、保存をJSONに変え、通信先(実在しない名前)を足してある | 記事22 |
| `DecompAt.java` | Ghidraのスクリプト。指定したアドレスに関数がなければ作り、疑似コードを出す | 記事23 |
| `DecompByName.java` | Ghidraのスクリプト。名前で関数を探し、疑似コードを出す | 記事23 |
| `coin-love/` | LÖVE版のコイン集め。`love coin-love selftest ddddddd` で、画面なしの試験ができる | 記事24 |
| `android-love.sh` | LÖVEのAndroid版のAPKを、REAで読む手順 | 記事24 |

## ビルドと実行

```sh
# C言語版(x86_64)
gcc -O1 -o coin_term coin_term.c
# C言語版(aarch64、静的リンク)。実行にはqemu-aarch64が要る
aarch64-linux-gnu-gcc -O1 -static -o coin_term-aarch64 coin_term.c

# C#版
mcs -out:CoinGame.exe CoinGame.cs

# JavaScript版
node coin-js/v1/main.js ddddddd

# LÖVE版(ゲームのファイルは、zipの一番上に main.lua を置く)
cd coin-love && zip -r -X ../coin-love.love conf.lua game.lua main.lua save.lua && cd ..
love coin-love.love
```

## 注意

- `android-love.sh` が読むAPKは、LÖVEの公式の配布物です。このリポジトリには入れていません。REAのAndroid用の命令には、Java 17以上と、`jadx-headless-mcp` 0.7.1のJARが要ります([REAの説明](https://github.com/morluto/rea/blob/472b72a53068a8e2ec78fe239d687023482daaa7/docs/android-analysis.md))。
- `coin_term` を `capture-process` で動かすと、動かす人の権限で動きます。REAの説明のとおり、これはサンドボックスではありません。
