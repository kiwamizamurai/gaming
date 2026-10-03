# CFWを入れる手順

このページでは、公式の文書が書いている手順から、ROCKNIXとKnulliの導入を整理します。どちらも、機種に合ったイメージをSDカードに書き込み、機種に挿して起動する流れです。機種によって、書き込みの前後に追加の作業があります。

## 共通する考え方

ROCKNIXの[公式の導入手順](https://rocknix.org/play/install/)は、機種用のイメージをダウンロードして、SDカードか内蔵ストレージに書き込み、起動してインストールを進める流れです。書き込みには、Windowsなら公式の「ROCKNIX Image Burner」を使えます。手動で行う場合は、リリースページからSoC別のイメージを取得して解凍し、Rufus、Raspberry Pi Imager、Win32 Disk Imager、または `dd` で書き込みます。

Knulliの[導入手順](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/install.md)も、ほぼ同じです。リリースページの「Installation Package Downloads」から機種用のイメージを取得し、複数の部分に分かれている場合は7zipで解凍して、SDカードに書き込みます。書き込み後に、Windowsが読めないパーティションの初期化を促しても、初期化してはいけません。

起動は、機種の電源を切った状態でSDカードを挿し、電源を入れて行います。機種によっては、起動順を設定してSDカードを先にする必要があります。Knulliの場合、2枚目のSDカードスロットがある機種では、初回の起動の間は、そのスロットは空にしておく決まりです。

## ROCKNIXの注意点

ROCKNIXのOS領域はext4でフォーマットされていて、Windowsでは直接読めません。ゲームを追加するには、ネットワーク転送、USB接続、2枚目のSDカードなどを使います。2枚目のSDカードは、ext4、FAT32、exFATのいずれでも、起動時に自動で認識されます。

## H700のAnbernic機の追加手順

ROCKNIXは、H700を載せたAnbernic機では、書き込みのあと、起動の前に、1回だけ手作業が必要だと書いています([導入ガイド](https://rocknix.org/configure/h700-installation/))。ROCKNIXのパーティションの `device_trees` フォルダから、機種に対応するDTBファイルを、パーティションの一番上のフォルダにコピーします。コピーしたファイルは、小文字の `dtb.img` に名前を変えます。最後に、パソコンの「取り出し」機能でSDカードを安全に外し、機種に挿して起動する流れです。取り出しの手順を省くと、SDカードが起動できなくなることがあり、その場合は最初の書き込みからやり直します。

DTBのファイル名は、機種ごとに決まっています。たとえば、RG40XX Hは `sun50i-h700-anbernic-rg40xx-h.dtb`、RG40XX Vは `sun50i-h700-anbernic-rg40xx-v.dtb`、RG CubeXXは `sun50i-h700-anbernic-rgcubexx.dtb` です。RG35XXの系統は、基板のリビジョンによって2種類のDTBがあります。外から見ても違いが分からないので、画面が乱れたときは、電源を10秒押し続けて切り、書き込みからやり直して、もう一方のDTBを試す流れです。

## Retroid Pocket 5へのROCKNIX導入

Retroid Pocket 5は、Androidの内蔵ストレージを残したまま、SDカードからROCKNIXを起動できます。[公式ページ](https://rocknix.org/devices/retroid/retroid-pocket-5/)の手順は次のとおりです。

1. SM8250版のROCKNIXを、SDカードに書き込みます。
2. AndroidでSDカードの `rocknix_abl` フォルダを内部ストレージの一番上にコピーします。
3. 設定の「Handheld Settings」、「Advanced」、「Run Script as Root」で、`rocknix_abl` フォルダを選びます。
4. `backup_abl.sh` を実行して、現在のABLをバックアップします。
5. `flash_abl.sh` を実行して、ROCKNIXのABLを書き込みます。
6. 再起動して、音量の下を押したままROCKNIXのABLに入ります。音量の上と下で項目を選び、電源ボタンで決定します。
7. 「Set device model」で、Retroid Pocket 5またはVisionox版を選びます。
8. 「Switch boot mode」で、ブートモードをLinuxにします。
9. 「Start」を選ぶと、ROCKNIXが起動します。

![ROCKNIX WikiのRetroid Pocket 5のページ](../assets/screenshots/rocknix-retroid-pocket-5.jpg)

ABLは、OSを起動する前に動く、最初のソフトウェアです。書き換えるとOSを入れ替えられますが、手順を誤ると機種が起動しなくなるおそれがあります。手順の4が、現在のABLを必ずバックアップする手順です。ROCKNIXのRetroid Pocket 6とAYN Odin 2のページにも、同じ手順の記載があります。

## Retroid Pocket 5へのKnulli導入

Knulliの[Retroid Pocket 5のページ](https://github.com/knulli-cfw/knulli.org/blob/main/docs/devices/goretroid/retroid-pocket-5.md)が書いているのは、SDカードを使う方法です。Knulliを書き込んだSDカードを挿して、機種の電源を切ってから、音量の上を押したまま電源を入れます。簡単な文字だけのメニューが表示されるので、「Boot」の選択は音量の上と下、決定は電源ボタンです。メニューは、画面が横向きではなく、縦向きに表示されることがあります。

## Knulliのパーティションと初回起動

Knulliを書き込むと、SDカードは6つの区画に分かれます。[パーティションの解説](https://github.com/knulli-cfw/knulli.org/blob/main/docs/guides/partitioning.md)によると、内訳は、約36MBの未割り当て領域、20MBと16MBのLinux用領域、約4GBのFAT32の `BATOCERA`、512MBの `SHARE`、残りの空き領域です。ゲームやテーマ、セーブデータは `SHARE` に置きます。`SHARE` は、初回の起動で、SDカードの残りの空き領域まで広がり、exFATで初期化されます。そのため、初回の起動は時間がかかる点に注意が必要です。

ゲームの置き場所を、2枚目のSDカードにする構成も選択肢です。Knulliは、使い続けるなら2枚構成を強く勧めています。1枚目をOSだけに使い、ゲームやテーマ、セーブデータを2枚目に置く形です。

## ゲームを追加する方法

ROCKNIXの[ゲームの追加](https://rocknix.org/play/add-games/)には、ネットワーク転送、USBガジェット、SDカード、USBドライブ、Linuxパソコン、NFSの方法があります。ネットワーク転送では、機種をWi-Fiにつなぎ、HTTP、SMB、SFTPのいずれかで接続します。接続のユーザー名は `root` で、パスワードは初期値が `rocknix` です。ファイルを追加したあとは、STARTメニューのゲーム設定から、ゲームリストを更新します。

Knulliでは、Windowsのエクスプローラーで `\\KNULLI`、macOSのFinderで `smb://KNULLI` を開くと、機種のフォルダが見えます。`roms` フォルダの中身は、機種ごとのサブフォルダです。BIOSは、Knulliの[BIOSの説明](https://github.com/knulli-cfw/knulli.org/blob/main/docs/play/bioses.md)にあるとおり、KNULLIに付属していません。BIOSには著作権があるため、自分で用意する必要があります。必要なBIOSは、ゲーム設定の「Missing BIOS check」で確認できます。
