# 自作ゲームを作る方法とオープンソースのツール

携帯機で遊ぶ自作ゲームは、機種ごとに作り方が違います。この記事では、ゲームボーイ、ゲームボーイアドバンス、Linux系の携帯機の三つに分けて、プログラミングの方法とオープンソースのツールを整理します。出典は公式のページです。作ったゲームの配布先は [自分で用意するデータと権利のないゲーム](13-own-data-and-free-games.md) にあります。

## コードを書かずに作る

プログラミングの経験がなくても、ゲームボーイのゲームは作れます。[GB Studio](https://www.gbstudio.dev/)は、ドラッグ&ドロップで作るゲーム制作ツールです。公式のページによると、見下ろし型、プラットフォーム型、シューティングなどを作れ、音楽の編集機能も内蔵しています。完成したゲームは本物のROMファイルとして書き出せるので、ゲームボーイのエミュレーターで遊べます。ブラウザ用の書き出しもあり、itch.ioへの公開も可能です。対応OSはWindows、Mac、Linuxです。ソースコードは[GitHub](https://github.com/chrismaltby/gb-studio)にあり、ライセンスはMITと確認できました。

![GB Studioの公式サイト](../assets/screenshots/gb-studio-home.jpg)

## ゲームボーイをCやアセンブリで作る

コミュニティの[gbdev.io](https://gbdev.io/)は、ゲームボーイの開発に取り組む非営利の集まりです。技術資料のPan Docs、資料集のawesome-gbdev、アセンブラのRGBDS、CコンパイラのGBDK 2020などを運営しています。[資料の一覧ページ](https://gbdev.io/resources.html)は、道具を種類ごとに並べた一覧です。

アセンブラでは、[RGBDS](https://github.com/gbdev/rgbds)が、ゲームボーイとゲームボーイカラー向けの標準的な開発ツールと位置づけられています。ライセンスはMITです。ブラウザ上で試せるRGBDS-Liveもあります。学習用には、アセンブリで作るチュートリアル「GB ASM Tutorial」が向いています。Hello Worldから始めてアルカノイド風のゲームを作り、最後にシューティングを仕上げる構成です。

Cで書くなら、[GBDK 2020](https://github.com/gbdk-2020/gbdk-2020)です。メンテナンスされているGBDKで、SDCCのツールチェーンを使い、Cコンパイラ、アセンブラ、リンカー、ライブラリを提供します。ライセンスは、GitHubの自動判定では種類を特定できないため、リポジトリのLICENSEで確認してください。GBDKの上に作るエンジンとして、ZGBとRetr0 GBが紹介されています。

画像と音の道具も、公開されています。タイルを編集するTilemap Studio、サウンドドライバーのDevSoundX、音楽を作るhUGETrackerなどです。動作の確認には、mGBA、SameBoy、Emulicious、BGBなどのエミュレーターを使います。Emuliciousは、VS Codeからソースを見ながらデバッグできるという紹介です。

完成したゲームは、実機のフラッシュカートに書き込んでも遊べます。書き込みにも使えるのは、[吸い出しの記事](13-own-data-and-free-games.md)で紹介した GBxCart RW と FlashGBX です。

## ゲームボーイアドバンスを作る

GBAは、[gbadev.net](https://gbadev.net/)が、コミュニティの拠点です。[導入のガイド](https://gbadev.net/getting-started.html)は、道筋を三つに分けています。

![gbadevの導入ガイド](../assets/screenshots/gbadev-getting-started.jpg)

高水準の道は、ゲームを作ることを優先する人向けです。ガイドは、UnityやGodotのようなPC向けのエンジンはなく、C#、Python、Javaも使えないと書いています。おすすめは、C++のライブラリの[Butano](https://github.com/GValiente/butano)で、ライセンスはZlibです。Luaで書くBPCore-Engineもあります。

低水準の道は、I/Oレジスタを直接扱う人向けです。ガイドが最も人気とするのは、devkitARMとlibtoncの組み合わせで、チュートリアルの「Tonc」は現在で最も良い教材とされています。ほかに、NimのNatuやRustのagbも紹介されています。ツールチェーンには、CMakeを使うgba-toolchainと、Mesonを使うmeson-gbaも選べる、という案内です。2003年が最後のリリースのDevKit Advanceは、古すぎるため使わないよう警告されています。ライブラリなしで一から作る道もありますが、助けを得にくいので、慣れた人向けです。

エミュレーターは、NanoBoyAdvance、mGBA、no$gbaが推奨されています。NanoBoyAdvanceは最も正確ですが、デバッグ機能がありません。GitHubのリポジトリは、2026年6月21日の更新を最後にアーカイブされました。mGBAにはGDBをつなげるので、PCのプログラムのようにデバッグできます。no$gbaは正確さで劣る一方、優れたデバッガー付きです。

## Linux系の携帯機に作る

ROCKNIX、Knulli、muOSなどのLinux系OSでは、PortMasterの仕組みを使います。[PortMasterの開発ページ](https://portmaster.games/porting.html)は、対応するゲームを5種類に分けています。GitHubなどのオープンソースのゲームをコンパイルして包むもの、一から作られたオープンソースのエンジン、GameMakerやGodot、LÖVEのような、元のデータが必要なエンジン、そしてBox86とBox64でx86のLinuxゲームを動かすものです。

![PortMasterの開発ページ](../assets/screenshots/portmaster-porting.jpg)

制約は大きいです。同じページは、多くのOSには完全なOpenGLがなく、X11もWestonもないと書いています。RockchipのAnbernic機は、古い3.x系のカーネルと、Mali用の独自ドライバーを使うため、使えるのはOpenGL ESだけです。OpenGL 2.x相当の機能は、GL4ESという変換のライブラリで補います。出力は、KMS/DRMかSDL2になり、VulkanとX11は使えません。

作る側から見て使いやすいのは、公式の実行環境が用意された道具です。SDL 1.2はsdl12-compatで変換できます。Godot 3は、FRTというエクスポートテンプレートで動かします。FRTではジョイスティックの処理が無効なので、操作の割り当てはgptokeybの担当です。LÖVEには、バージョンごとのaarch64版があります。Godot 4、Java、LibGDX、SFML、SDL3、Allegroは、WestonPackというランタイムの対象です。Javaの例として、Minecraft用のランチャーやUncivが挙げられています。

コントローラーの操作は、gptokebyでキーボードやマウスに割り当てます。`./gptokeyb "application" -c mykeymaps.gptk` のように呼び出し、STARTとSELECTでの終了にも対応する形です。開発中は、SSHで機器に入って試すことが勧められています。その際は、フロントエンドを止めてください。ROCKNIXでは `systemctl stop essway.service`、Knulliでは `/etc/init.d/S31emulationstation stop` が使えます。完成後は、同じサイトの[パッケージのガイド](https://portmaster.games/packaging.html)に沿って、ポートの形に整える流れです。

LÖVEを使う場合、KMS/DRMにはマウスカーソルがないため、ゲームごとに、ソフトウェアで描くカーソルを入れる必要があると、同じページに説明があります。

## 最小のゲームを作る

ここからは、実際に手を動かします。同じ「コインを集める」ゲームを、LÖVE(Lua)とGBDK(C)の二通りで作りました。コードは、この調査の中でビルドして、動作を確かめたものです。ソースはリポジトリの[examples/love2d-coin](../examples/love2d-coin)と[examples/gbdk-coin](../examples/gbdk-coin)にあります。

### ROMは必要か、何で作るか

ROMが要るかは、遊ぶ機器で決まります。ゲームボーイとゲームボーイアドバンスは、エミュレーターも実機のフラッシュカートも、ROMファイルを読み込む仕組みです。GB Studioの公式ページにも、完成品を本物のROMファイルとして書き出せるとあります。GB向けの自作では、ROMを作る手順が必ず入ります。

Linux系のOSでは、ROMを作る必要はありません。PortMasterの[開発ページ](https://portmaster.games/porting.html)が、LÖVEのゲームを対応するエンジンに挙げていて、[パッケージのガイド](https://portmaster.games/packaging.html)のLÖVE用の起動スクリプトは、`lovegame`というフォルダをそのまま実行する形です。Luaのファイルを置いたフォルダが、ゲームの本体になります。

言語は、LÖVEがLua、GBDKがCです。最初の一本には、LÖVEをおすすめします。PCですぐ動かせて、コードも短く、画面の確認が速いためです。GBDKは、ROMの仕組みを学ぶ二本目に向いています。Android機向けの作り方は、この調査では扱っていません。

### LÖVEで作る(ROMなし)

LÖVEは、Luaで書く2Dゲームのフレームワークです。[公式のリリースページ](https://github.com/love2d/love/releases/tag/11.5)には、11.5のmacOS用、Windows用、Linux用のAppImage、Android用のAPKが並んでいます。macOSでは、Homebrewのcaskが2026年9月1日に無効化されていて、`brew install --cask love`が失敗しました。理由は、macOSのGatekeeperの検査に通らないためと表示されます。この調査では、リリースページのmacOS用のzipを展開して使いました。

作るファイルは二つだけです。まず、窓の大きさを決める`conf.lua`です。

```lua
function love.conf(t)
  t.window.title = "Coin Catcher"
  t.window.width = 640
  t.window.height = 480
end
```

続いて、ゲーム本体の`main.lua`を書きます。

```lua
local SIZE = 32
local SPEED = 240
local TIME_LIMIT = 30

local player, coin, score, timeLeft

local function placeCoin()
  coin.x = love.math.random(0, 640 - SIZE)
  coin.y = love.math.random(0, 480 - SIZE)
end

local function reset()
  player = { x = 304, y = 224 }
  coin = { x = 100, y = 100 }
  score = 0
  timeLeft = TIME_LIMIT
  placeCoin()
end

local function isDown(key, padButton)
  if love.keyboard.isDown(key) then
    return true
  end
  local pad = love.joystick.getJoysticks()[1]
  return pad ~= nil and pad:isGamepad() and pad:isGamepadDown(padButton)
end

local function overlaps(a, b)
  return a.x < b.x + SIZE and b.x < a.x + SIZE
     and a.y < b.y + SIZE and b.y < a.y + SIZE
end

function love.load()
  reset()
end

function love.update(dt)
  if timeLeft <= 0 then
    return
  end
  timeLeft = timeLeft - dt

  local dx, dy = 0, 0
  if isDown("left", "dpleft") then dx = dx - 1 end
  if isDown("right", "dpright") then dx = dx + 1 end
  if isDown("up", "dpup") then dy = dy - 1 end
  if isDown("down", "dpdown") then dy = dy + 1 end

  player.x = math.max(0, math.min(640 - SIZE, player.x + dx * SPEED * dt))
  player.y = math.max(0, math.min(480 - SIZE, player.y + dy * SPEED * dt))

  if overlaps(player, coin) then
    score = score + 1
    placeCoin()
  end
end

function love.draw()
  love.graphics.setColor(1, 0.85, 0.1)
  love.graphics.rectangle("fill", coin.x, coin.y, SIZE, SIZE)
  love.graphics.setColor(0.2, 0.7, 1)
  love.graphics.rectangle("fill", player.x, player.y, SIZE, SIZE)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(string.format("SCORE %d   TIME %d", score, math.max(0, math.ceil(timeLeft))), 10, 10)
  if timeLeft <= 0 then
    love.graphics.printf("TIME UP  Press Enter / A", 0, 220, 640, "center")
  end
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  elseif key == "return" and timeLeft <= 0 then
    reset()
  end
end

function love.gamepadpressed(_, button)
  if button == "a" and timeLeft <= 0 then
    reset()
  end
end
```

LÖVEは、決まった名前の関数を、決まったタイミングで呼びます。`love.load`は起動時に一度、`love.update(dt)`は毎フレーム、`love.draw`は描画のたびの呼び出しです。`dt`は前のフレームからの経過秒数で、移動量を`SPEED * dt`にすれば、フレームの速さに関係なく同じ速さで動きます。

`isDown`は、キーボードの矢印キーと、ゲームパッドの十字キーの両方を扱う関数です。携帯機では、十字キーがゲームパッドとして届く場合があるため、両方に対応させています。当たり判定の`overlaps`は、二つの四角が重なるかを、四辺の位置の比較だけで調べます。

動かし方は、ゲームのフォルダを、LÖVEに渡すだけです。

```sh
love examples/love2d-coin
```

macOSで展開したzipを使う場合は、アプリの中の実行ファイルを呼びます。たとえば`love.app/Contents/MacOS/love examples/love2d-coin`です。矢印キーで青い四角を動かし、黄色い四角に触れると得点が増えます。制限時間は30秒で、終わったあとはEnterで再開できます。

![LÖVEで動かしたコイン集め](../assets/screenshots/love2d-coin.png)

動作は、入力を模擬するテスト用のスクリプトでも確認しました。0.1秒だけ右へ押し続けると、速さ240で24ピクセル進みます。コインの位置まで動くと、得点が0から1に増えました。画面の端では位置が止まり、時間切れのあとは得点が動きません。Enterを押すと、得点は0に戻りました。

携帯機に入れるときは、PortMasterの流れに合わせます。パッケージのガイドでは、ポートの名前は、小文字の英数字とピリオド、アンダースコアだけです。起動スクリプトは、大文字を含む名前で、`.sh`で終わります。LÖVE用の例は、`source $controlfolder/runtimes/"love_11.5"/love.txt`でランタイムを読み込み、`$LOVE_RUN "$GAMEDIR/lovegame"`でゲームを起動する形です。ランタイムは11.5で、この記事で動かしたLÖVEと同じ版です。ただし、この起動スクリプトを実際の携帯機で動かす確認は、この調査ではできていません。置き場所は、ROCKNIXが`/roms/ports/`、Knulliが`/userdata/roms/ports`です。公式のポートとして登録するなら、`port.json`、`README.md`、スクリーンショット、`gameinfo.xml`が必要になります。複数のOSと解像度でのテストも、PortMasterは求めています。

### GBDKで作る(ROMあり)

GBDK-2020は、ゲームボーイ用のCコンパイラとライブラリのセットです。[公式のリリースページ](https://github.com/gbdk-2020/gbdk-2020/releases/tag/4.5.0)から、4.5.0のmacOS(Apple Silicon)用の`gbdk-macos-arm64.tar.gz`を取りました。展開すると、`bin/lcc`というコンパイラが入っています。遊ぶ側のエミュレーターには、mGBAを使います。macOSでは`brew install mgba`で入りました。

ゲームのコードは、次の`main.c`です。

```c
#include <gb/gb.h>
#include <gbdk/console.h>
#include <stdint.h>
#include <stdio.h>

#define PLAYER 0
#define COIN 1

static const uint8_t tiles[] = {
    0xFF, 0xFF, 0x81, 0xFF, 0xBD, 0xFF, 0xA5, 0xFF,
    0xA5, 0xFF, 0xBD, 0xFF, 0x81, 0xFF, 0xFF, 0xFF,
    0x3C, 0x3C, 0x7E, 0x42, 0xFF, 0x99, 0xFF, 0xA5,
    0xFF, 0xA5, 0xFF, 0x99, 0x7E, 0x42, 0x3C, 0x3C,
};

static uint8_t px = 80, py = 80;
static uint8_t cx = 120, cy = 100;
static uint8_t seed = 1;
static uint8_t score = 0;

static uint8_t rnd(void) {
    seed = (uint8_t)(seed * 75u + 74u);
    return seed;
}

static void place_coin(void) {
    cx = 8 + (rnd() % 144);
    cy = 24 + (rnd() % 120);
}

static uint8_t near(uint8_t a, uint8_t b) {
    return (a > b ? a - b : b - a) < 8;
}

void main(void) {
    uint8_t keys;

    set_sprite_data(0, 2, tiles);
    set_sprite_tile(PLAYER, 0);
    set_sprite_tile(COIN, 1);
    SHOW_SPRITES;

    gotoxy(0, 0);
    printf("SCORE %u", (unsigned int)score);

    while (1) {
        keys = joypad();
        seed = (uint8_t)(seed + 1);

        if ((keys & J_LEFT) && px > 8) px--;
        if ((keys & J_RIGHT) && px < 160) px++;
        if ((keys & J_UP) && py > 16) py--;
        if ((keys & J_DOWN) && py < 152) py++;

        if (near(px, cx) && near(py, cy)) {
            score++;
            place_coin();
            gotoxy(0, 0);
            printf("SCORE %u", (unsigned int)score);
        }

        move_sprite(PLAYER, px, py);
        move_sprite(COIN, cx, cy);
        vsync();
    }
}
```

ゲームボーイの画面は、タイルという8×8の絵を並べて作ります。[Pan Docs](https://gbdev.io/pandocs/Tile_Data.html)によると、1タイルは16バイトで、1行を2バイトで表します。最初のバイトが色の番号の下位ビット、次のバイトが上位ビットで、1ピクセルが2ビット、つまり4色です。スプライトでは、色の番号0が透明になります。コードの`tiles`は、この形式で書いた2枚のタイルで、1枚目がプレイヤーの四角、2枚目がコインの丸です。

[OAMの説明](https://gbdev.io/pandocs/OAM.html)によると、スプライトの位置は、画面の位置にYは16、Xは8を足した値で指定します。そのため、コードの移動範囲は、Xが8から160、Yが16から152です。`move_sprite`には、このずれを含めた値を渡します。`set_sprite_data`でタイルをVRAMに送り、`set_sprite_tile`でスプライトに割り当て、`vsync`で画面の更新を待つ流れです。得点は、`gotoxy`と`printf`による背景の文字です。

ビルドに必要なのは`lcc`を呼ぶ一行だけで、`Makefile`にまとめてあります。

```make
GBDK_HOME ?= $(HOME)/gbdk

coin.gb: main.c
	GBDK_HOME=$(GBDK_HOME)/ $(GBDK_HOME)/bin/lcc -o $@ main.c

clean:
	rm -f coin.gb *.o *.lst *.map *.sym *.asm *.ihx *.noi
```

`make GBDK_HOME=$HOME/gbdk`で、`coin.gb`という32キロバイトのROMができます。mGBAで開くには、次のとおりです。

```sh
mgba coin.gb
```

ビルドで、二つの失敗がありました。一つ目は、コンパイラの`lcc`が、実行しても何も出力せず、終了コード133で止まった問題です。原因は、GBDKを置いたフォルダのパスが長いことでした。`lldb`で調べると、`lcc`が文字列バッファの検査に失敗していました。`$HOME/gbdk`のような、短いパスに置くと、直ります。二つ目は、`gotoxy`が「暗黙の宣言」とエラーになった問題です。宣言は`<gbdk/console.h>`にあり、`<gb/gb.h>`には含まれません。

動作は、PyBoyというオープンソースのエミュレーターで、ボタン入力を模擬して確かめました。右ボタンを押すと、スプライトのX座標が増えます。上ボタンを押し続けると、Y座標は16で止まりました。プレイヤーをコインの位置まで動かすと、画面に`SCORE 1`と出て、コインは別の場所へ移りました。

![GBDKで作ったROMの画面](../assets/screenshots/gbdk-coin.png)

確認はPCのエミュレーター上で終えています。実機のフラッシュカートへ書き込むには、[吸い出しの記事](13-own-data-and-free-games.md)のFlashGBXと、対応するカートが必要です。携帯機のエミュレーターで遊ぶなら、ROMを、そのOSのゲームボーイ用ROMフォルダに置いてください。フォルダの名前は、OSごとの文書で確認する必要があります。

### 少し広げる(絵、効果音、壁、最高点の保存)

最小のゲームは、四角を動かすだけでした。ここから、絵、効果音、壁のあるマップ、最高点の保存を足します。足したものは、同じ「コイン集め」の発展版として、`examples/love2d-coin-plus`と`examples/gbdk-coin-plus`に置きました。どちらも、素材は外から持ってきていません。絵は文字で書いたドット絵を、Pythonの`make_assets.py`と`make_tiles.py`が画像に変換します。LÖVE版の効果音も、`make_assets.py`が波形を計算して、`coin.wav`に書き出します。素材の権利を気にせず、そのまま配れる形です。

![LÖVE版の発展形。壁、タイル、最高点](../assets/screenshots/love2d-coin-plus.png)

#### LÖVE版

画面は、32ピクセルのタイルで組む方式です。壁と床、プレイヤー、コインの4枚は、1枚の画像`tiles.png`に横に並べてあり、必要な部分だけを切り出して描きます。切り出しにはQuadを使います。公式ウィキの[love.graphics.newQuad](https://love2d.org/wiki/love.graphics.newQuad)では、Quadはテクスチャの一部で描くための仕組みで、スプライトシートに向くと説明されています。同じページの注意は、`love.update`や`love.draw`から繰り返し呼ぶと遅くなるので、一度だけ作って使い回すこと。コードも、`love.load`の中で一度だけ作る形です。

```lua
function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  sheet = love.graphics.newImage("tiles.png")
  quads = {}
  for i, name in ipairs({ "grass", "rock", "player", "coin" }) do
    quads[name] = love.graphics.newQuad((i - 1) * TILE, 0, TILE, TILE, sheet:getDimensions())
  end
  pickup = love.audio.newSource("coin.wav", "static")
  best = loadBest()
  reset()
end
```

`setDefaultFilter("nearest", "nearest")`は、絵を拡大するときの補間をやめて、ドットをそのまま見せるための指定です。この指定について、公式ウィキの説明は、この調査では確認していません。

壁は、文字の並びで書いた地図で表します。`#`が壁、`.`が床です。`map.lua`は、座標がどのタイルに当たるかを計算して、壁かどうかを調べます。

```lua
function M.isSolid(col, row)
  if col < 0 or row < 0 or col >= M.cols or row >= M.rows then
    return true
  end
  return rows[row + 1]:sub(col + 1, col + 1) == "#"
end

function M.hitsWall(x, y, w, h)
  local c1 = math.floor(x / M.TILE)
  local c2 = math.floor((x + w - 1) / M.TILE)
  local r1 = math.floor(y / M.TILE)
  local r2 = math.floor((y + h - 1) / M.TILE)
  for r = r1, r2 do
    for c = c1, c2 do
      if M.isSolid(c, r) then
        return true
      end
    end
  end
  return false
end
```

四角の四隅が、どれか壁のタイルに入るかを調べるだけの、単純な当たり判定です。移動は、横と縦を別々に判定します。横に動けなくても縦には動ける形で、壁に沿って滑るように動きます。

最高点は、保存用のフォルダへ、文字として書き出す方式です。[love.filesystem.write](https://love2d.org/wiki/love.filesystem.write)の公式ウィキでは、この関数は保存用ディレクトリにファイルを書き、既存のファイルは完全に置き換えると説明されています。戻り値は、成功したかどうかと、失敗時のメッセージです。保存先は、`conf.lua`の`identity`で決まるフォルダです。このゲームの`identity`は`coin-catcher-plus`で、macOSでは`~/Library/Application Support/LOVE/coin-catcher-plus`に`highscore.txt`ができました。

```lua
local function loadBest()
  if love.filesystem.getInfo(SAVE_FILE) then
    local text = love.filesystem.read(SAVE_FILE)
    return tonumber(text) or 0
  end
  return 0
end

local function finish()
  if score > best then
    best = score
    local ok, message = love.filesystem.write(SAVE_FILE, tostring(best))
    if not ok then
      print("save failed: " .. message)
    end
  end
end
```

動作は、前と同じ方法で検証しました。0.1秒右へ押すと24ピクセル進み、左へ押し続けると壁の手前の36ピクセルで止まります。コインの位置に動くと得点が1増え、制限時間が切れると、得点5が`highscore.txt`に書かれました。次に起動すると、最高点が5と表示されました。効果音の再生は、ファイルの読み込みに成功したことまでを確認しています。音を聞いての確認は、していません。

#### GBDK版

![GBDK版の発展形。タイルの壁と床](../assets/screenshots/gbdk-coin-plus.png)

ゲームボーイ版でも、壁と床を、背景のタイルで描きます。地図は、LÖVE版と同じく文字の並びです。

```c
static const char *const rows[ROWS] = {
    "####################",
    "#..................#",
    "#..................#",
    "#...##........##...#",
    "#...##........##...#",
    "#..................#",
    "#..................#",
    "#........##........#",
    "#........##........#",
    "#........##........#",
    "#..................#",
    "#..................#",
    "#...##........##...#",
    "#...##........##...#",
    "#..................#",
    "#..................#",
    "#..................#",
    "####################",
};
```

壁の判定は、地図の文字を直接見ます。

```c
static uint8_t solid(uint8_t col, uint8_t row) {
    if (col >= COLS || row >= ROWS) {
        return 1;
    }
    return rows[row][col] == '#';
}

static uint8_t hits_wall(uint8_t x, uint8_t y) {
    return solid((x + 1) >> 3, (y + 1) >> 3)
        || solid((x + 6) >> 3, (y + 1) >> 3)
        || solid((x + 1) >> 3, (y + 6) >> 3)
        || solid((x + 6) >> 3, (y + 6) >> 3);
}
```

絵は、`tiles.png`に4枚のタイルを描き、GBDK付属の`png2asset`でCのデータに変えました。コマンドは`png2asset tiles.png -spr8x8 -tiles_only -o tiles.c`です。生成された`tiles.c`には、4枚分で64バイトのデータが入っています。背景のタイルは128番から読み込みます。128番からの領域は背景とスプライトで共有されるので、プレイヤーとコインも、130番と131番で指定できる形です。共有については、[Pan Docs](https://gbdev.io/pandocs/Tile_Data.html)のタイルデータの表に記載があります。

最高点の保存には、カートリッジの中のバッテリー付きRAMを使います。[MBC5のPan Docs](https://gbdev.io/pandocs/MBC5.html)によると、RAMは`A000`から`BFFF`の範囲に現れ、`0000`から`1FFF`に`0A`を書くと、読み書きが有効になります。コードは、この手順のとおり、RAMを有効にして値を書き、最後に閉じます。

```c
static void load_best(void) {
    SWITCH_RAM(0);
    ENABLE_RAM;
    best = (*(uint8_t *)0xA000 == SAVE_MAGIC) ? *(uint8_t *)0xA001 : 0;
    DISABLE_RAM;
}

static void save_best(void) {
    SWITCH_RAM(0);
    ENABLE_RAM;
    *(uint8_t *)0xA000 = SAVE_MAGIC;
    *(uint8_t *)0xA001 = best;
    DISABLE_RAM;
}

static void beep(void) {
    NR52_REG = 0x80;
    NR51_REG = 0x11;
    NR50_REG = 0x77;
    NR10_REG = 0x16;
    NR11_REG = 0x40;
    NR12_REG = 0x73;
    NR13_REG = 0x00;
    NR14_REG = 0xC3;
}
```

ROMのヘッダーでRAM付きのカートリッジだと名乗るために、ビルドのときに`-Wm-yt0x1B -Wm-ya1`を付けます。できたROMを`file`コマンドで見ると、`MBC5+RAM+BATT`、RAM 64Kbitと表示されました。

効果音は、音のレジスタを直接書いて鳴らします。[Audio RegistersのPan Docs](https://gbdev.io/pandocs/Audio_Registers.html)によると、`NR52`の最上位ビットが音声の電源、`NR51`が左右の割り当て、`NR50`が全体の音量です。チャンネル1は、`NR12`で初期音量と減衰を、`NR13`と`NR14`の下位3ビットで11ビットの周期を決めます。`NR14`の最上位ビットを立てて書くと、音が鳴り始めます。周波数は、`131072 ÷ (2048 − 周期の値)`ヘルツです。コードの周期は`0x300`なので、始まりの音程は計算上は約102ヘルツで、`NR10`のスイープで変化します。この音は、実機でも、エミュレーターの音としても、耳では確認していません。

動作は、PyBoyで確かめました。STARTで始まり、右ボタンを10フレーム押すとX座標が20進みます。左と上へ押し続けると、壁の手前の8で止まりました。コインの位置に重ねると得点が1になり、コインは別の場所へ移っています。時間切れで最高点が更新され、エミュレーターを閉じると、8192バイトのセーブファイルが生成されました。もう一度起動すると、最高点が復元されています。時間切れのあと、STARTで再開するのは、ボタンを離した時点です。コードの`waitpadup`が、離すまで待つためです。

#### 次に作れるもの

この2本のコードに、次の要素を足していくと、遊べる形に近づきます。LÖVEでは、敵を動かす、複数のステージを切り替える、`love.graphics.newImage`で背景を描く、といった方向があります。GBDKでは、メタスプライトで大きなキャラクターを作る、BGMのドライバーを入れる、といった方向です。[gbdev.ioの資料集](https://gbdev.io/resources.html)に、GBDK向けのチュートリアルと、音楽ツールが並んでいます。

## この記事で出てくる中国語

この記事の話題は、英語の公式文書が中心です。中国語は、この調査で出典を確認できた、基本の語だけを載せます。中国語で自作ゲームの情報を探すときの足がかりに使ってください。

| 中国語 | ピンイン | 日本語の意味 | 出典 |
|---|---|---|---|
| 开源 | kāiyuán | オープンソース | [开源掌机吧](https://tieba.baidu.com/f?kw=%E5%BC%80%E6%BA%90%E6%8E%8C%E6%9C%BA) |
| 掌机 | zhǎngjī | 携帯ゲーム機 | [掌机圈](https://zhangjiquan.com/handhelds) |
| 游戏 | yóuxì | ゲーム | CNFansの出品ページ |
| 模拟器 | mónǐqì | エミュレーター | [天马G前端的使用](https://blog.csdn.net/fanged/article/details/152960565) |
| 屏幕分辨率 | píngmù fēnbiànlǜ | 画面の解像度 | [RG-406V](https://zhangjiquan.com/handheld/rg-406v) |
| 操作系统 | cāozuò xìtǒng | OS | [RG-556](https://zhangjiquan.com/handheld/rg-556) |

LÖVEやGBDKの用語を、中国語の資料で調べたい場合は、まず「开源」と「掌机」を、[検索キーワード](../chinese/search-keywords.md)の組み合わせに足して検索すると、貼吧や知乎の記事が見つかります。この検索の結果は、この調査では確認していません。

## 学べること

ゲームボーイは、CPUとメモリの仕組みを少ない命令で学べる教材です。Pan DocsとGB ASM Tutorialがそろい、エミュレーターのデバッガーで動作を確認できます。GBAでは、devkitARMとlibtoncを使い、I/Oレジスタを直接扱う練習ができます。Linux系の携帯機は、SSHで入ってビルドし、グラフィックスAPIの制約に合わせる経験の場です。移植の作業は、OpenGL ESとKMS/DRMの違いを学ぶ入り口にもなります。
