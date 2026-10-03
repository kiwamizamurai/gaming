# ROCKNIX公式Wiki

種類は、携帯ゲーム機向けLinuxの公式Wikiです。URLは https://rocknix.org/ で、ソースは https://github.com/ROCKNIX/distribution です。信頼度は公式です。Retroid Pocket 5のページは、スクリーンショットを撮りました。

![ROCKNIX WikiのRetroid Pocket 5のページ](../assets/screenshots/rocknix-retroid-pocket-5.jpg)

## トップページ

ROCKNIXを、携帯ゲーム機のレトロゲームのエミュレーションに向けた、イミュータブルなLinuxディストリビューションと説明しています。小さな愛好家のコミュニティが開発しています。機能として、ローカルとリモートのマルチプレイ、対応機種でのタッチ操作、電力と性能のプロファイル、音楽と動画の再生、Bluetoothの音声とコントローラー、HDMIとUSBの出力、SyncthingとrcloneによるクラウドとLANの同期、WireGuardとTailscaleとZeroTierのVPN、RetroAchievementsとゲーム情報の自動取得が挙がっています。ライセンスは、GPL v2の部分と、各部品が持つライセンスが混在し、非営利のみの部品も含まれます。GitHubのREADMEは、ROCKNIXがJELOSのフォークだと書いています。

## 対応機種

メニューの機種の一覧には、Anbernic(RG351P/M/V、RG353P/M/V/VS、RG503、RG552、RG ARC、RG35XX 2024、Plus、Pro、H、SP、RG28XX、RG40XX V、RG40XX H、RG CubeXX)、AYANEO(Pocket ACE、DMG、EVO、DS、S2)、AYN(Odin 2、Odin 2 Mini、Odin 2 Portal、Thor、Odin 3)、GameForce(Ace)、Hardkernel(Odroid Go Advance、Super、Ultra)、MagicX(XU Mini M)、Mangmi(Air X)、Powkiddy(RGB10、RGB10 Max 3 Pro、RGB10 Max 3、RGB10X、RK2023、RGB20SX、RGB20 Pro、RGB30、X35S、X35H、X55、XU10)、Retroid(Pocket 5、6、Flip2、Mini、Nova)、名前のない機種(R33S、R35S/R36S、EEクローン)があります。

## 導入、アップデート、ゲームの追加

[導入](https://rocknix.org/play/install/)のページは、Windows用のImage Burnerと、手動の書き込みの2つの方法を書き、書き込み後の起動までを説明します。OS領域はext4で、Windowsからは直接読めません。[H700の導入ガイド](https://rocknix.org/configure/h700-installation/)は、H700のAnbernic機で、起動前にDTBファイルをコピーして `dtb.img` に名前を変える手順を、15機種分のファイル名とともに載せています。RG35XX系は、基板のリビジョンで2種類のDTBがあります。

[ゲームの追加](https://rocknix.org/play/add-games/)は、ストレージの考え方(外部SDとの統合の「Merged Storage」と、外部SDだけを使う「Simple Storage」)から始まり、ネットワーク転送(HTTP、SMB、SFTP)、USBガジェット、SDカード、リカバリーモード、USBドライブ、Linuxパソコン、NFSの方法を順に説明しています。ネットワーク接続のユーザー名は `root`、パスワードの初期値は `rocknix` です。[アップデート](https://rocknix.org/play/update/)のページは、OTA、手動の `.tar` ファイル、開発ビルドの3つの方法を書いています。

## 機種のページ

[RG40XX H](https://rocknix.org/devices/anbernic/rg40xx-h/)は、H700(Cortex-A53の4コア1.4GHz、Mali G31)、4インチ640×480、1GB LPDDR4、Wi-FiとBluetoothを持つと書かれ、設定でオーバークロックして1.5GHzにできます。[R35S/R36S](https://rocknix.org/devices/unbranded/game-console-r35s-r36s/)は、RK3326(Cortex-A35の4コア1.3GHz、Mali G31)、3.5インチ640×480、1GB DDR3で、2024年のR36Sに新しい画面があるときは、パネル用のオーバーレイファイルを置く手順があります。

[Retroid Pocket 5](https://rocknix.org/devices/retroid/retroid-pocket-5/)は、Snapdragon 865(SM8250)、メインラインLinux、Freedreno、Turnip、SwayとEmulationStationを使うと書かれています。ホットキー、N64、PSP、GC/Wii、PS2(AetherSX2)、Xbox、PS1、3DS、Atari Jaguarの操作、ABLの書き込みの手順、デュアルスクリーンの設定があります。Retroid Pocket 6とAYN Odin 2のページにも、同じABLの手順があり、SoCはSnapdragon 8 Gen 2(SM8550)です。
