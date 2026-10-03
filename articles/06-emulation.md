# 何が動くか

どの機種で、どのゲーム機のソフトが動くかは、SoCの性能、エミュレーターの対応状況、画面の形で決まります。ここでは、機種ごとに掲載された評価と、OSの対応表をもとに整理する方針です。

## 機種ごとの目安

仕様のデータベースの[掌机圈](https://zhangjiquan.com/handhelds)は、機種ごとに「模拟器支持」の欄を設けています。同じ書き方で比べられるので、この調査で最も使いやすい資料でした。ただし、記述はユーザーの投稿を含むため、実機での確認ではありません。

RG-40XXHの欄は、対応する形式を、PSP、DOS、NDS、N64、PS1、DC、アーケード、GBA、GBC、GB、SFC、FC、MAME、MDなど多数の名前で挙げています([RG-40XXH](https://zhangjiquan.com/handheld/rg-40xxh))。これは対応する形式の一覧で、快適に動くかどうかは別の話です。RG40XXHの冷却を改造した百度貼吧の投稿では、投稿者が、H700でPS1を2倍の解像度で動かしても、フィルターとマスクを切れば止まらないと返信しています。ドリームキャストのエミュレーターも、640×480に設定すれば止まらないということです([给RG40XXH改造散热](https://tieba.baidu.com/p/10191425150))。同じスレッドには、「H700でPS1の2倍解像度すら重い」という反対の意見もあり、設定によって結果が分かれます。

RG-406Vの欄は、「N64、DC、PSP」だけを挙げ、PS2とGameCubeには触れていません([RG-406V](https://zhangjiquan.com/handheld/rg-406v))。同じT820を載せたRG-556の欄は、もう少し具体的です。N64、Dreamcast、PSPはすべて満足なフレームレートで動き、GameCubeとWiiは大部分が遊べ、PS2は一部が遊べ、Switchは簡単なゲームだけという記述です([RG-556](https://zhangjiquan.com/handheld/rg-556))。SoCが同じでも、記述の量は掲載ごとに違います。この違いは、2機種の差ではなく、書き手の差と見たほうがよいでしょう。

![掌机圈のRG-556のページ。「模拟器支持」の欄がある](../assets/screenshots/zhangjiquan-rg556-spec-rows.png)

Retroid Pocket 4 Proの欄は、GameCube、Wii、PS2まで最大で動き、Switchは簡単な小さなゲームだけとしています([RP4 Pro](https://zhangjiquan.com/handheld/retroid-pocket-4-pro))。Retroid Pocket 5は、GameCube、Wii、PS2までで、少数のSwitchのゲームも動くという記述です([RP5](https://zhangjiquan.com/handheld/retroid-pocket-5))。Retroid Pocket Novaは、一部のSwitchのゲームまでで、購入者のコメントには、PS3とPCのエミュレーターも遊べるとあります([Nova](https://zhangjiquan.com/handheld/retroid-pocket-nova))。

世代の目安をまとめると、H700が8〜16ビット機とPS1、一部のDCとPSP。T820がN64、DC、PSPに加えて、GCとWiiの大部分、PS2の一部。Dimensity 1100とSnapdragon 865が、PS2までと、少数のSwitch。Snapdragon 8 Gen 2が、Switchの一部とPS3の試行、という並びになります。

## OSごとの対応エミュレーター

ROCKNIXは、Retroid Pocket 5のページで、エミュレーターごとの操作の割り当てを書いています。載っているのは、N64のMupen64Plus-SA、PSPのPPSSPP-SA、GameCubeとWiiのDolphin、PS2のAetherSX2、Xboxのxemu、PS1のDuckStation、3DSのAzahar、Atari JaguarのBigPEmuです([ROCKNIX Retroid Pocket 5](https://rocknix.org/devices/retroid/retroid-pocket-5/))。Snapdragon 8 Gen 2のRetroid Pocket 6やAYN Odin 2のページには、これらに加えて、N64のGopher64が載っています。

RG40XX Hのページは、PS1のDuckStation、PSPのPPSSPP-SA、N64のMupen64Plus-SAとともに、RetroArchとMednafenの操作を載せています。GameCube、PS2、3DSのエミュレーターの操作表は載っていません([ROCKNIX RG40XX H](https://rocknix.org/devices/anbernic/rg40xx-h/))。

## 画面の形と大きさ

画面の形も、遊びやすさを左右します。PSPやPS2のソフトを4:3の画面で表示すると、画面の上下か左右に黒い帯が入り、実際に使える表示が小さくなります。RG406Vは4インチの4:3、Retroid Pocket 5は5.5インチの16:9、Retroid Pocket Novaは4.5インチの4:3です。4:3のゲームを、黒い帯なしで大きく表示できるかどうかは、画面の形に合わせて機種を選ぶ理由になります。

## 重い3Dのゲーム

GTAのような重い3Dのゲームが動くかどうかは、この調査では、具体的な出典を集められませんでした。PS2のエミュレーションは、CSDNの記事が書くとおり、Androidのエミュレーターが中心です([天马G前端的使用](https://blog.csdn.net/fanged/article/details/152960565))。PS2を遊ぶ前提なら、掌机圈が最大でPS2まで動くと書いているRetroid Pocket 4 ProやRetroid Pocket 5以上を候補にするのが無難です。
