# 中華ゲーム機の全体像

このリポジトリで扱うのは、中国のメーカーが作る、レトロゲームのエミュレーションを主な用途にした携帯ゲーム機です。中国語では「掌机」(携帯ゲーム機)に「开源」(オープンソース)や「复古」(レトロ)を付けて「开源掌机」「复古掌机」と呼びます。

中国語の情報は、百度貼吧の[开源掌机吧](https://tieba.baidu.com/f?kw=%E5%BC%80%E6%BA%90%E6%8E%8C%E6%9C%BA)に集まっています。このコミュニティは、ページの表示によると関注者が7.9万人、投稿数が143.1万件で、2014年3月に作られました。

![开源掌机吧のトップページ](../assets/screenshots/tieba-open-source-handheld-bar.jpg)

## ブランドと愛称

製品を作っているブランドは、OSの対応機種一覧が手がかりです。[ROCKNIXの対応機種一覧](https://rocknix.org/devices/)には、Anbernic、AYANEO、AYN、GameForce、Hardkernel、MagicX、Mangmi、Powkiddy、Retroidが載っています。[Knulliの対応機種一覧](https://github.com/knulli-cfw/knulli.org/blob/main/docs/devices/index.md)には、これらに加えて、MiyooとTrimUIも載っているのが違いです。

中国語の掲示板では、ブランドに愛称が付いています。機種のデータベースの[掌机圈](https://zhangjiquan.com/handhelds)は、Anbernicの[RG-406V](https://zhangjiquan.com/handheld/rg-406v)と[RG-556](https://zhangjiquan.com/handheld/rg-556)を、それぞれ「周哥RG-406V」「周哥RG556」という別名で載せています。「周哥」がAnbernicの愛称です。Retroidは「沙雕」と呼ばれ、掌机圈には[Retroid Pocket 5](https://zhangjiquan.com/handheld/retroid-pocket-5)の別名として「沙雕5,RP 5」、[Retroid Pocket 4 Pro](https://zhangjiquan.com/handheld/retroid-pocket-4-pro)の別名として「沙雕4 Pro,RP4 Pro」、[Retroid Pocket Nova](https://zhangjiquan.com/handheld/retroid-pocket-nova)の別名として「沙雕 Nova」が載っています。隠語の詳細は [中国語の語彙と隠語](11-chinese.md) にまとめました。

各ブランドの位置づけについて、什么值得买に載った記事は、Miyooを小型で200元以内の機種を出すブランド、GKD(老张)をOSの最適化に強いブランド、Anbernicを品ぞろえの最も広いブランドと説明しています。この記事は、ページ上で「AIGC文章」(AI生成の記事)と表示されているため、数値や評価を裏づけとして使うときは、ほかの出典で確認する必要があります([2026开源掌机红黑榜](https://post.smzdm.com/p/aww5ev54/))。

![什么值得买の记事。AIGCの表示がある](../assets/screenshots/smzdm-ranking-aigc.jpg)

## 性能を決めるSoC

携帯機の性能は、ほぼSoCで決まります。この調査で確認できたSoCを、性能の低い順に並べると次のようになります。

| SoC | 主な機種 | 出典 |
|---|---|---|
| Rockchip RK3326 | R35S、R36S | [ROCKNIX R35S/R36S](https://rocknix.org/devices/unbranded/game-console-r35s-r36s/) |
| Allwinner H700 | RG40XXH、RG35XX系、RG CubeXX | [掌机圈 RG-40XXH](https://zhangjiquan.com/handheld/rg-40xxh) |
| Unisoc T820(虎贲T820) | RG406V、RG556 | [掌机圈 RG-406V](https://zhangjiquan.com/handheld/rg-406v) |
| MediaTek Dimensity 1100 | Retroid Pocket 4 Pro | [掌机圈 RP4 Pro](https://zhangjiquan.com/handheld/retroid-pocket-4-pro) |
| Snapdragon 865 | Retroid Pocket 5 | [掌机圈 RP5](https://zhangjiquan.com/handheld/retroid-pocket-5) |
| Snapdragon 8 Gen 2 | Retroid Pocket Nova、AYN Odin 2 | [掌机圈 Nova](https://zhangjiquan.com/handheld/retroid-pocket-nova)、[ROCKNIX Odin 2](https://rocknix.org/devices/ayn/odin2/) |

R36Sは、ROCKNIXのページによると、Cortex-A35の4コア1.3GHz、Mali G31、1GBのDDR3、3.5インチ640×480の画面という構成です。H700は、掌机圈のRG-40XXHのページでCortex-A53の4コア1.5GHz、Mali-G31 MP2、1GBのLPDDR4とされています。ROCKNIXのRG40XX Hのページは、同じH700について、標準で1.4GHzで動作し、設定でオーバークロックすると1.5GHzになると書いています([ROCKNIX RG40XX H](https://rocknix.org/devices/anbernic/rg40xx-h/))。

T820は、掌机圈のRG-406VとRG-556のページで、Cortex-A76とCortex-A55の8コア(2.1〜2.7GHz)、GPUがMali-G57 MP4(850MHz)と記載されています。同じページは、このSoCのPassMark多コアスコアを5577としています。

Dimensity 1100とSnapdragon 865は、掌机圈によると、前者がCortex-A78の8コア(2.6GHz)とMali-G77 MC9、後者がCortex-A77とCortex-A55の8コア(1.8〜2.84GHz)とAdreno 650です。Snapdragon 8 Gen 2のNovaは、Cortex-X3を含む8コア(2.0〜3.2GHz)とAdreno 740で、メモリはLPDDR5Xの8〜12GBです。

## 価格帯

価格帯の分け方には、100〜200元をR36Sのような入門機、300〜500元をRG35XXシリーズなどの中堅機、1000〜3000元をRetroid Pocket 5やRG556などの上位機とする記事があります。これもAIGCと表示された[2026开源掌机红黑榜](https://post.smzdm.com/p/aww5ev54/)の記述です。

掌机圈が示す価格帯は、RG-40XXHが300〜500元、Retroid Pocket 5が1000〜1500元、Retroid Pocket Novaが1500〜2000元です。RG-556とRetroid Pocket 4 Proは150〜200ドルと表示されています。

どの価格帯を選ぶかは、遊びたいゲームの機種で決まります。何が動くかは [何が動くか](06-emulation.md) にまとめました。
