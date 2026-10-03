# 何が動くか

どの機種で、どのゲーム機のソフトが動くかは、SoCの性能、エミュレーターの対応状況、画面の形で決まります。ここでは、機種ごとに掲載された評価と、OSの対応表をもとに整理する方針です。

## 機種ごとの目安

仕様のデータベースの[掌机圈](https://zhangjiquan.com/handhelds)は、機種ごとに「模拟器支持」の欄を設けています。同じ書き方で比べられるので、この調査で最も使いやすい資料でした。ただし、記述はユーザーの投稿を含むため、実機での確認ではありません。

RG-40XXHの欄は、対応する形式を、PSP、DOS、NDS、N64、PS1、DC、アーケード、GBA、GBC、GB、SFC、FC、MAME、MDなど多数の名前で挙げています([RG-40XXH](https://zhangjiquan.com/handheld/rg-40xxh))。これは対応する形式の一覧で、快適に動くかどうかは別の話です。RG40XXHの冷却を改造した百度貼吧の投稿では、投稿者が、H700でPS1を2倍の解像度で動かしても、フィルターとマスクを切れば止まらないと返信しています。ドリームキャストのエミュレーターも、640×480に設定すれば止まらないということです([给RG40XXH改造散热](https://tieba.baidu.com/p/10191425150))。同じスレッドには、「H700でPS1の2倍解像度すら重い」という反対の意見もあり、設定によって結果が分かれます。

RG-406Vの欄は、「N64、DC、PSP」だけを挙げ、PS2とGameCubeには触れていません([RG-406V](https://zhangjiquan.com/handheld/rg-406v))。同じT820を載せたRG-556の欄は、もう少し具体的です。N64、Dreamcast、PSPはすべて満足なフレームレートで動き、GameCubeとWiiは大部分が遊べ、PS2は一部が遊べ、Switchは簡単なゲームだけという記述です([RG-556](https://zhangjiquan.com/handheld/rg-556))。SoCが同じでも、記述の量は掲載ごとに違います。この違いは、2機種の差ではなく、書き手の差と見たほうがよいでしょう。

![掌机圈のRG-556のページ。「模拟器支持」の欄がある](../assets/screenshots/zhangjiquan-rg556-spec-rows.png)

Retroid Pocket 4 Proの欄は、GameCube、Wii、PS2まで最大で動き、Switchは簡単な小さなゲームだけとしています([RP4 Pro](https://zhangjiquan.com/handheld/retroid-pocket-4-pro))。Retroid Pocket 5は、GameCube、Wii、PS2までで、少数のSwitchのゲームも動くという記述です([RP5](https://zhangjiquan.com/handheld/retroid-pocket-5))。Retroid Pocket Novaは、一部のSwitchのゲームまでで、購入者のコメントには、PS3とPCのエミュレーターも遊べるとあります([Nova](https://zhangjiquan.com/handheld/retroid-pocket-nova))。

世代の目安を、上の各機種の欄の記述から並べると、H700が8〜16ビット機とPS1、一部のDCとPSP。T820がN64、DC、PSPに加えて、GCとWiiの大部分、PS2の一部。Dimensity 1100とSnapdragon 865が、PS2までと、少数のSwitch。Snapdragon 8 Gen 2が、Switchの一部とPS3の試行、という並びになります。

## エミュレーターの種類と選び方

携帯機のOSで動くエミュレーターは、大きく2種類に分かれます。1つはRetroArchの中で動く「コア」で、もう1つは単体で動くエミュレーターです。Knulliの公式ドキュメントは、単体のエミュレーターの多くが、オートセーブとロードに対応しないと説明しています。セーブデータの画像を付けられないものや、セーブをEmulationStationの画面に出せないものもあります。ただし、機能としては問題なく動き、動作の違いに慣れれば使えるとのことです([Game Settings](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/game-settings.md))。

同じゲーム機に、複数のエミュレーターが用意されている例は多くあります。Knulliは、機種ごとに「多くのゲームと低性能の携帯機に合う」と考えるものを既定にしました。ゲームがうまく動かないときは、エミュレーターを替えて試す方法を勧めています。N64のように再現が難しい機種では、ゲームごとに向くエミュレーターが違う場合もある、という説明です。切り替えは、機種ごとの設定かゲームごとの設定で行います([同上](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/game-settings.md))。

ROCKNIXの公式Wikiは、システムごとのページに、選べるエミュレーターを表で載せていて、表によっては、既定を示す印や基板名の列も付く作りです。ファミコンの欄には、既定のNestopiaのほか、FCEUmm、QuickNES、Mesenがあります。スーパーファミコンの欄は、既定のSnes9xに加えて、Snes9xの旧版3種とbsnes系の構成です。ゲームボーイとゲームボーイカラーは、既定がGambatteで、SameBoy、Gearboy、TGB Dual、mGBA、VBA-Mも選べます([NES](https://rocknix.org/systems/nes/)、[SNES](https://rocknix.org/systems/snes/)、[GB](https://rocknix.org/systems/gb/))。メガドライブはGenesis Plus GX、Genesis Plus GX Wide、PicoDriveの3つです([Genesis](https://rocknix.org/systems/genesis/))。

選び方の目安は、まず既定を使い、問題が出てから替える、という手順です。ROCKNIXの表は、あくまで「選べる」エミュレーターの一覧で、そのゲームが快適に動くかどうかまでは示しません。この調査では、実機で動作を試していないため、動作の良し悪しは、掲示板の投稿や各エミュレーターの公式資料に頼って書いています。

## OSごとの対応エミュレーター

ROCKNIXは、Retroid Pocket 5のページで、エミュレーターごとの操作の割り当てを書いています。載っているのは、N64のMupen64Plus-SA、PSPのPPSSPP-SA、GameCubeとWiiのDolphin、PS2のAetherSX2、Xboxのxemu、PS1のDuckStation、3DSのAzahar、Atari JaguarのBigPEmuです([ROCKNIX Retroid Pocket 5](https://rocknix.org/devices/retroid/retroid-pocket-5/))。Snapdragon 8 Gen 2のRetroid Pocket 6やAYN Odin 2のページには、これらに加えて、N64のGopher64が載っています。

RG40XX Hのページは、PS1のDuckStation、PSPのPPSSPP-SA、N64のMupen64Plus-SAとともに、RetroArchとMednafenの操作を載せています。GameCube、PS2、3DSのエミュレーターの操作表は載っていません([ROCKNIX RG40XX H](https://rocknix.org/devices/anbernic/rg40xx-h/))。

## システムごとの動作状況

ここからは、システムごとに、選べるエミュレーターと、公式資料で確認できた動作上の注意を並べます。取り上げる順は、ゲーム機の世代が新しくなる順に近い並びです。

### ゲームボーイアドバンス

ROCKNIXのGBAのページでは、mGBAが既定で、gpSP、VBA-M、VBA Next、Beetle GBAも選べます。RK3588向けには、単体のNanoBoyAdvanceも載っています([GBA](https://rocknix.org/systems/gba/))。

![ROCKNIX WikiのGBAのページ。エミュレーターの表に既定の印がある](../assets/screenshots/rocknix-systems-gba-cores.jpg)

libretroの公式ドキュメントによると、mGBAは、多くの既存のGBAエミュレーターより、速く正確であることを目指したエミュレーターです。ゲームボーイとゲームボーイカラーのゲームも動かせます。コアのオプションに「Idle loop removal」があり、性能が足りない低性能のハードで使うと、GBAのCPUへの負荷を下げられるとの説明です。「Frameskip」で、滑らかさと引き換えにコマ落としを増やす設定もあります([mGBA](https://docs.libretro.com/library/mgba/))。

gpSPは、同じ資料の互換性の欄に、動作しないゲームの例が載っています。たとえば、傾きセンサーを使う『WarioWare: Twisted!』と、太陽センサーを使うBoktaiシリーズ(資料の表記はBoktai Trilogy)は、センサーが再現されない、と書かれています。一方、mGBAのオプションには、太陽センサーの明るさを変える項目があります([gpSP](https://docs.libretro.com/library/gpsp/)、[mGBA](https://docs.libretro.com/library/mgba/))。

### PlayStation

ROCKNIXのPS1の表には、Beetle PSX、単体のDuckStation、PCSX ReARMed、PCSX ReARMed 32、DuckStation、SwanStationが載っています。基板の列で見ると、RK3326を挙げているのはPCSX ReARMedの2つだけです。単体のDuckStationはS922X、RK3399、RK3588、RK3566の4つで、「DuckStation」と「SwanStation」の欄は「All」です。なお、この表の基板の列にH700の名前はなく、H700での対応は表からは確認できませんでした([PSX](https://rocknix.org/systems/psx/))。

libretroの公式ドキュメントでは、PCSX ReARMedは、ARMのCPU向けに特別な最適化を加えた、PCSX Reloadedの派生です。オプションの「Dynamic recompiler」は、32ビットのARMならari64、64ビット対応の環境ならlightrecが使われます。倍の解像度で描画する「Enhanced resolution」は、速度が落ちると明記され、その高速化の設定はゲームに不具合を起こす、とも書かれています。遅い記憶媒体で映像が途切れるときは、「CD Access Method」を非同期にする方法があり、全体をメモリに読み込む方式はCHDだけが対象です([PCSX ReARMed](https://docs.libretro.com/library/pcsx_rearmed/))。

DuckStationのREADMEは、遊びやすさと速度を重視しつつ、低性能の機器でも動く正確さを目指すと説明しています。「ハック」の設定は勧めず、既定の設定で、遊べるゲームがすべて動くことが目標です。機能の一覧には、描画の拡大、PGXPによる頂点の精度の改善、テクスチャの置き換えなどが並びます。必要な環境は、OpenGL 3.1、OpenGL ES 3.1、Direct3D 11のFeature Level 10.0、Vulkan 1.0のいずれかに対応するGPUです([DuckStation](https://github.com/stenzek/duckstation))。

### PSP

PSPは、ROCKNIXの表に載る2つがどちらもPPSSPPです。単体のPPSSPPと、libretroのPPSSPPが選べます([PSP](https://rocknix.org/systems/psp/))。PPSSPPの公式ドキュメントは、最も有効な改善策として、描画の解像度を挙げています。PSPのゲームは480×272で動くよう作られていて、設定は、その何倍かで指定します。4倍がほぼ1080pで、8倍が4Kに当たります([Graphics settings](https://www.ppsspp.org/docs/settings/graphics/))。

高い解像度では、メニューやHUDの要素の間に細い線が出ることがあります。PSPのゲームは、480×272でだけ試されているためです。ドット絵を拡大して使うゲームは、解像度を上げても恩恵が少なく、拡大や回転、ベクター図形を使うゲームでは、見た目が良くなる、とも書かれています([同上](https://www.ppsspp.org/docs/settings/graphics/))。

### Nintendo 64

ROCKNIXのN64の表では、Mupen64Plus-Nextが既定で、Mupen64Plus、Parallel N64、単体のMupen64Plus、単体のGopher64も選べます([N64](https://rocknix.org/systems/n64/))。libretroの資料によると、Mupen64Plus-Nextは、描画のプラグインにGLideN64が既定で使われ、AngrylionとParaLLEl-RDPも選べます。ParaLLEl-RDPとParaLLEl-RSPによる、最新のLLEの開発も取り込まれています。一方で、同じ資料は、RSPをLLEにすると、より正確な代わりに計算の負荷が増える、とも説明しています([Mupen64Plus-Next](https://docs.libretro.com/library/mupen64plus/))。

### ニンテンドーDSと3DS

DSでは、ROCKNIXの表で、melonDSが既定です。DeSmuME、単体のmelonDS、単体のDrasticも選べます。3DSは、単体のAzaharだけが載っています([NDS](https://rocknix.org/systems/nds/)、[3DS](https://rocknix.org/systems/3ds/))。AzaharのREADMEは、Azaharを、PCとモバイル向けの、高レベルエミュレーションの3DSエミュレーターと説明し、Citraの流れを引き継ぐと書いています([Azahar](https://github.com/azahar-emu/azahar))。

### ドリームキャスト

ドリームキャストの表には、Flycastが3種類(通常、2021年版、32ビット版)と、単体のFlycastが載っています。基板の列では、RK3326に4つすべてが載り、32ビット版はRK3326だけが対象です([Dreamcast](https://rocknix.org/systems/dreamcast/))。単体のFlycastは、ドリームキャストに加えて、Naomi、Naomi 2、Atomiswaveも扱うと、READMEに書かれています([Flycast](https://github.com/flyinghead/flycast))。

### GameCubeとWii

どちらも、ROCKNIXの表に載るのはDolphinです。単体版、Qt版、libretro版の3つが選べます([GameCube](https://rocknix.org/systems/gamecube/)、[Wii](https://rocknix.org/systems/wii/))。Dolphinの公式ガイドは、Androidの機器に、64ビットのAndroid 5.0以降を求めています。Android 9以降が推奨で、Qualcommなら、高性能コアが2つ以上あるSnapdragon 700以降が目安です。GPUは、RDNA2系かSnapdragonが最も性能が出て、上位のMaliでも遊べる場合がある、と書かれています。それ以外のメーカーは、一般には推奨されません([Performance Guide](https://dolphin-emu.org/docs/guides/performance-guide/))。

### PlayStation 2とそれ以降

PS2は、ROCKNIXの表で、AetherSX2だけが載っています。基板の列は、RK3588、S922X、RK3399、SD865です([PS2](https://rocknix.org/systems/ps2/))。パソコン向けのPCSX2の公式資料は、PS2の負荷の高さを知る参考になります。最低の要件でも、SSE4.1に対応するx86-64のCPUが2つの物理コア、メモリが8GB、Vulkan 1.1などに対応するGPUが必要です。中間の要件では、AVX2に対応する4コアのCPUと16GBのメモリが並びます。資料は、要件がゲームごとに大きく変わるとも断っています([PCSX2 System Requirements](https://pcsx2.net/docs/setup/requirements/))。これはパソコンの要件で、携帯機にそのまま当てはまる値ではありません。

それより新しい世代は、ROCKNIXの表にエミュレーターが載るものの、携帯機での動作は、この調査で確認できませんでした。Wii UはCemu、PS3はRPCS3、XboxはxemuがROCKNIXの表にあります。PS Vitaは、Vita3Kが載るページに、対応が作業中と書かれています([Wii U](https://rocknix.org/systems/wiiu/)、[PS3](https://rocknix.org/systems/ps3/)、[Xbox](https://rocknix.org/systems/xbox/)、[PS Vita](https://rocknix.org/systems/psvita/))。

## 設定の目安

エミュレーターの設定は、画質を上げる方向と、速度を上げる方向の2つに分かれます。ここでは、公式の資料にある目安を、エミュレーターごとにまとめます。数値は資料の記述で、機種の動作を保証する値ではありません。

### PPSSPP

PPSSPPの公式の推奨設定は、性能の高い機器と低い機器で、分けて書かれています。高い機器では、描画の解像度を画面に合わせ、テクスチャの補間を「Auto Max Quality」にします。Vulkanを使い、MSAAを4倍か8倍にして、高速化の設定はすべて切る組み合わせです。低い機器では、解像度を2倍か1倍まで下げ、後処理の効果を切ります。ソフトウェアのスキニングは、効く場合と効かない場合があるため、試して判断するよう書かれています。それでも足りないときの最後の手段が、フレームスキップを1か2にする方法です([Recommended settings](https://www.ppsspp.org/docs/settings/recommended/))。

遅延を減らしたい場合の項目も、同じページにあります。リズムゲームのPataponのようなゲームでは、Vulkanを使い、「Buffer graphics commands」を1か「No buffer」にして、VSyncを切る設定です([同上](https://www.ppsspp.org/docs/settings/recommended/))。なお、描画のバックエンドについて、Vulkanは多くの機器で推奨され、OpenGLはAndroidでの互換性のための選択肢と説明されています([Graphics settings](https://www.ppsspp.org/docs/settings/graphics/))。

### Dolphin

Dolphinの公式ガイドは、性能を上げる設定を、効果と副作用の両方から説明しています。「Enable Dual Core」は効果が大きい一方で、CPUとGPUの処理を別のコアに分けるため、まれに不明な命令のエラーで落ちることがあります。「Emulated CPU Clock Override」は、弱い機器で性能を稼ぐ強力な手段です。100%より下げると、ゲームの内部で処理落ちが起き、多くのゲームが持つコマ飛ばしの機能で、負荷が大きく下がります。ただし、特定のタイミングに頼るゲームでは、不具合が出る場合もあります([Performance Guide](https://dolphin-emu.org/docs/guides/performance-guide/))。

描画のバックエンドは、GPUによって向き不向きがあります。Vulkanは、NVIDIAとAMD、携帯機のRDNA2で良好です。Adreno(Snapdragon)は、ドライバーによって差があると書かれています。OpenGLは最も遅いが安定する、という位置づけです。内部解像度は、内蔵GPUや携帯機では、2倍でも目に見えて遅くなる場合があるため、画質と速度の間でちょうどよい点を探すよう、勧められています([同上](https://dolphin-emu.org/docs/guides/performance-guide/))。

シェーダーのコンパイルによるカクつきは、設定で対策できます。標準の「Specialized」は、新しいシェーダーを作るたびに止まることがあり、遊ぶほど減ります。「Hybrid Ubershaders」は、止まりを大きく減らす設定です。ただし、NVIDIAのVulkanでは勧められていません。「Exclusive Ubershaders」は、止まりをなくす代わりに、高い解像度で負荷が非常に高く、強力なデスクトップ向けGPUでなければ勧められません([同上](https://dolphin-emu.org/docs/guides/performance-guide/))。

### PS1とGBAのコア

PS1のPCSX ReARMedは、フレームスキップを0から3まで選べます。「Frame duping」は、新しい描画データがないときに、前のフレームを再利用して速度を稼ぐ設定です。「Threaded Rendering」は、GPUの命令を別のスレッドで処理する設定で、同期と非同期を選べます。「PSX cpu clock」は、既定が57で、30から100の範囲です。下げると負荷が減ることがありますが、互換性の問題が出るため、必要なゲームだけで変えるよう書かれています([PCSX ReARMed](https://docs.libretro.com/library/pcsx_rearmed/))。

GBAのmGBAは、フレームスキップを0から10まで選べます。「Idle loop removal」には「Remove Known」「Detect and Remove」「Don't Remove」の3つがあり、低性能のハードで使う設定として説明されています([mGBA](https://docs.libretro.com/library/mgba/))。N64のMupen64Plus-Nextでは、CPUコアの「dynamic_recompiler」が最速で、環境によっては選べません。フレームバッファのエミュレーションは、性能に問題があるときにだけ切る、と書かれています。「Less accurate blending mode」は、遅いGPUでの高速化になりますが、不具合が出る場合もあります([Mupen64Plus-Next](https://docs.libretro.com/library/mupen64plus/))。

### 設定の結果をどう読むか

ここまでの設定は、いずれもエミュレーターの公式の説明です。同じ設定が、機種や基板によって効くとは限りません。冒頭で触れた貼吧のスレッドで、H700のPS1が、2倍の解像度でも止まらないという返信と、重いという返信が並んでいたのも、これだけでは、どちらが正しいかは判断できません。実機での数値は、この調査では取っていません。

## 画面の形と大きさ

画面の形も、遊びやすさを左右します。PSPやPS2のソフトを4:3の画面で表示すると、画面の上下か左右に黒い帯が入り、実際に使える表示が小さくなります。RG406Vは4インチの4:3、Retroid Pocket 5は5.5インチの16:9、Retroid Pocket Novaは4.5インチの4:3です。4:3のゲームを、黒い帯なしで大きく表示できるかどうかは、画面の形に合わせて機種を選ぶ理由になります。

ゲーム側の画面比も、システムごとに違います。libretroの資料では、gpSPのGBAの画面比が3:2、PCSX ReARMedのPS1が4:3との記載です。PSPのゲームは、PPSSPPの資料によると480×272が基準です([gpSP](https://docs.libretro.com/library/gpsp/)、[PCSX ReARMed](https://docs.libretro.com/library/pcsx_rearmed/)、[Graphics settings](https://www.ppsspp.org/docs/settings/graphics/))。Knulliのシェーダーの説明では、「RCG-Integer-Dramatic-LCD-CRT」は整数倍の拡大が必要で、整数倍にならない画面には別の設定が用意された形です([Shaders](https://github.com/knulli-cfw/knulli.org/blob/main/docs/configure/customization/shaders.md))。

## 重い3Dのゲーム

GTAのような重い3Dのゲームが動くかどうかは、この調査では、具体的な出典を集められませんでした。PS2のエミュレーションは、CSDNの記事が書くとおり、Androidのエミュレーターが中心です([天马G前端的使用](https://blog.csdn.net/fanged/article/details/152960565))。PS2を遊ぶ前提なら、掌机圈が最大でPS2まで動くと書いているRetroid Pocket 4 ProやRetroid Pocket 5以上を候補にするのが無難です。

## この記事で出てくる中国語

機種のデータベースと掲示板のスレッドで確認できた語を、表に整理しました。

| 中国語(簡体字) | ピンイン | 日本語の意味 | 出典 |
|---|---|---|---|
| 掌机 | zhǎngjī | 携帯ゲーム機 | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 掌机圈 | zhǎngjīquān | 機種のデータベースのサイト名 | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 模拟器支持 | mónǐqì zhīchí | エミュレーターの対応状況 | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 处理器 | chǔlǐqì | プロセッサー(SoC) | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 屏幕尺寸 | píngmù chǐcùn | 画面の大きさ | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 屏幕比例 | píngmù bǐlì | 画面の縦横比 | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 内置 | nèizhì | 内蔵 | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 外置 | wàizhì | 外付け | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 满帧率 | mǎn zhēnlǜ | フレームレートが上限まで出ること | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 可玩 | kě wán | 遊べる | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 部分 | bùfen | 一部 | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 小游戏 | xiǎo yóuxì | 小さなゲーム | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 霍尔摇杆 | huò'ěr yáogǎn | ホール素子を使うスティック | [掌机圈のRG-556のページ](https://zhangjiquan.com/handheld/rg-556) |
| 散热 | sànrè | 放熱 | [貼吧のスレッド](https://tieba.baidu.com/p/10191425150) |
| 改造 | gǎizào | 改造 | [貼吧のスレッド](https://tieba.baidu.com/p/10191425150) |
