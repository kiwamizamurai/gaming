# gaming

中華製のハンドヘルドゲーム機を教材にして、コンピュータ・ゲーム・ソフトウェア・ハードウェアを学び、あわせて中国語も勉強するための学習リポジトリ。

実機の購入検討から始めたリサーチのメモを起点に、次の3つを同じ場所で積み上げる。

1. 端末(SoC、画面、冷却、OS)の違いを調べて比較する
2. エミュレーション、フロントエンド、OS、ブートローダなどの仕組みを学ぶ
3. 中国のECサイト、掲示板、記事を読みながら中国語の語彙を増やす

## 目次

| 場所 | 内容 |
|---|---|
| [docs/learning-roadmap.md](docs/learning-roadmap.md) | 何が学べるか。ハードウェア、OS、ソフトウェア、ネットワーク、中国語の学習テーマ一覧 |
| [docs/devices.md](docs/devices.md) | 端末ごとのスペックと価格の比較(出典と確認状況つき) |
| [docs/os-and-software.md](docs/os-and-software.md) | Android機とLinux系OS、フロントエンド、エミュレーター、天馬Gの構造 |
| [docs/shopping-notes.md](docs/shopping-notes.md) | 淘宝、閑魚、代行サービスでの探し方と、実際に見た出品のメモ |
| [docs/forums-and-sources.md](docs/forums-and-sources.md) | 中国語の掲示板、記事サイト、英語圏のコミュニティ |
| [docs/links.md](docs/links.md) | 参照した記事と公式資料へのリンク集 |
| [chinese/vocabulary.md](chinese/vocabulary.md) | 語彙表(ピンイン、意味、出てきた場所) |
| [chinese/slang.md](chinese/slang.md) | 掲示板や出品で見かけた隠語、俗称 |
| [chinese/search-keywords.md](chinese/search-keywords.md) | 検索に使った中国語キーワード |
| [assets/screenshots](assets/screenshots) | 調査時のスクリーンショット |

## 記録のルール

- 出典のあるものは、URLか記事タイトルを添える。
- 自分で確認できていないものは「未確認」と書く。推測は推測として書き分ける。
- 価格は日付つきで書く。USD表記はCNFansの表示価格で、国際送料と手数料は含まない。
- 語彙は見つけた文脈(商品名、記事、掲示板)を併記する。
- スクリーンショットは `assets/screenshots` に置き、該当するmdから相対パスで貼る。

## 著作権について

ゲームのROM、BIOS、それらを大量に収録した「整合包」の配布物は、権利面で問題がある場合が多い。このリポジトリでは、ROMやBIOSの入手先、配布リンク、ダウンロード手順は記録しない。仕組みの学習と、自分で正規に用意したデータを使う前提で書く。

## 現在の調査状況(2026-10-03)

- 比較した端末: RG40XXH、RG406V、Retroid Pocket 4 Pro、Retroid Pocket 5
- PS2やGTAまで遊ぶ候補としては、Snapdragon 865のRetroid Pocket 5を軸に整理した
- OSの自由度は、公式にROCKNIXが対応するRetroid Pocket 5が有利と整理した
- 天馬Gは、Pegasusを中国語化したフロントエンドと、そのパックの総称だと整理した
- ゲームが入ったカードの具体的な収録タイトルは、出品ページからは確認できていない
