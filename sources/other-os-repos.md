# そのほかのOSのリポジトリ

種類は、各OSのGitHubリポジトリと公式Wikiです。信頼度は公式です。星の数と更新日は、2026年10月3日に `gh` コマンドで確認しました。

## GammaOS Core

[GammaOS Core](https://github.com/TheGammaSqueeze/GammaOSCore)は、LineageOSをもとにしたAndroid 13 TVの最小構成で、Rockchip RK3566のような低性能のチップを使い、タッチスクリーンが不要な機種向けです。メモリの使用量を減らし、使い勝手を上げる改造が入っています。ライセンスはApache-2.0で、最後の更新は2025年2月でした。

対応機種は、Anbernic(RG ARC-D/S、RG353V/VS、RG353P/PS、RG353M、RG503)、Powkiddy(RGB30、RGB20SX、RGB10MAX3、RGB20 PRO、X55、X35H、X35S)、GameMT(E5 Plus、E6 Plus)、GKD(Bubble)、そのほか(CB408、Miyoo Flip)、TrimUI(Smart Pro)、MagicX(Zero28)です。機能は、SDカードからの起動(内蔵のeMMCに入っているシステムは残せる)、RetroArchとランチャーのDaijishoの事前設定、MiXplorer、root化とMagiskへの対応、電源ボタンの長押しで開くクイック設定、SelectとR1の長押しで使えるマウスのエミュレーション、Bluetoothの音声、USBのMTP、CPUとGPUの性能向上、電池の持ちの向上、ファイルアクセス制限(スコープドストレージ)の緩和、HDMI出力の設定です。

## ArkOSとJELOS

[ArkOS](https://github.com/christianhaitian/arkos)は、「Another rockchip Operating System」と説明され、READMEは、詳しい情報とイメージへのリンクを[Wiki](https://github.com/christianhaitian/arkos/wiki)に任せています。最後の更新は2025年8月で、星は約2150です。[JELOS](https://github.com/JustEnoughLinuxOS/distribution)は「Home of the JELOS Linux distribution」と説明され、最後の更新は2024年5月、星は約950です。ROCKNIXのREADMEは、ROCKNIXをJELOSのフォークと書いています。

## muOS

[MustardOS](https://github.com/MustardOS)の組織には、フロントエンド(`frontend`)、内部(`internal`)、アセット(`asset`)、テーマ(`theme`)、ウェブサイト(`mustardos.github.io`)、ツール(`tool`)、言語(`language`)、追加機能(`extra`)、ターミナル(`terminal`)、ファイルマネージャー(`vtree`)などのリポジトリがあります。ウェブサイトのリポジトリには、対応機種のデータ(RG28XX-H、RG34XX-H、RG34XX-SP、RG35XX 2024、H、Plus、Pro、SP、RG40XX-H、V、RG CubeXX-H、TrimUIのBrickとSpoon)と、各機能の説明があります。公式サイトのmuos.devは、この調査のブラウザでは読み取れませんでした。

## LineageOS

[LineageOSの公式Wiki](https://wiki.lineageos.org/devices/RPN)に、Retroid Pocket Novaのページがあります。コードネームは「RPN」、SoCは「Qualcomm Dragonwing QCS8550」、RAMは8または12GB LPDDR5、CPUはKryoの1×3.2GHz、4×2.8GHz、3×2.0GHz、GPUはAdreno 740、発売は2026年7月と表示されています。ページには、導入の手順、自分でのビルド、更新、特別な起動モード(音量下と電源の同時押しでリカバリーモードとブートローダーに入る)、既知の問題(デバイスの整合性)へのリンクがあります。
