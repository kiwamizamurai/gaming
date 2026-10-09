# 記録(操作A)だけを見て作り直したコイン集め。
# 分かったこと: 幅10、@は0から、$は7から。dで右へ。$を取ると10点、次の$は2。
#               終了時に best.sav へ 0x4B と点数の2バイトを書く。
# 分からないこと: 壁での動き。ここでは「反対側へ回り込む」と推測した。
import sys

x, coin, score, best = 0, 7, 0, 0

def draw():
    row = ['.'] * 10
    row[coin] = '$'
    row[x] = '@'
    print(f"[{''.join(row)}] score={score} best={best}", flush=True)

draw()
while True:
    c = sys.stdin.read(1)
    if c == '' or c == 'q':
        break
    if c not in 'ad':
        continue
    x = (x - 1) % 10 if c == 'a' else (x + 1) % 10   # 推測: 回り込む
    if x == coin:
        score += 10
        coin = 2 if coin == 7 else 7                  # 観測: 7の次は2
    draw()
if score > best:
    open('best.sav', 'wb').write(bytes([0x4B, score]))
print(f"bye score={score}", flush=True)
