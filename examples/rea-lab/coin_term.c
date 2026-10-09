/* 端末で遊ぶコイン集め。a/dで左右に動き、コイン($)を取ると10点。qで終了。
   最高点は gbdk-coin-plus と同じく2バイト(目印0x4B、点数)で best.sav に保存する。 */
#include <stdio.h>

#define WIDTH 10
#define SAVE_MAGIC 0x4B

static int load_best(void) {
    unsigned char b[2];
    FILE *f = fopen("best.sav", "rb");
    if (!f) return 0;
    int n = fread(b, 1, 2, f);
    fclose(f);
    return (n == 2 && b[0] == SAVE_MAGIC) ? b[1] : 0;
}

static void save_best(int best) {
    unsigned char b[2] = { SAVE_MAGIC, (unsigned char)best };
    FILE *f = fopen("best.sav", "wb");
    if (!f) return;
    fwrite(b, 1, 2, f);
    fclose(f);
}

static void draw(int x, int coin, int score, int best) {
    char row[WIDTH + 1];
    for (int i = 0; i < WIDTH; i++) row[i] = '.';
    row[coin] = '$';
    row[x] = '@';
    row[WIDTH] = '\0';
    printf("[%s] score=%d best=%d\n", row, score, best);
    fflush(stdout);
}

int main(void) {
    int x = 0, coin = 7, score = 0, best = load_best();
    draw(x, coin, score, best);
    int c;
    while ((c = getchar()) != EOF) {
        if (c == 'q') break;
        if (c == 'a' && x > 0) x--;
        if (c == 'd' && x < WIDTH - 1) x++;
        if (c != 'a' && c != 'd') continue;
        if (x == coin) {
            score += 10;
            coin = (coin * 3 + 1) % WIDTH;   /* 次のコインの場所 */
            if (coin == x) coin = (coin + 1) % WIDTH;
        }
        draw(x, coin, score, best);
    }
    if (score > best) save_best(score);
    printf("bye score=%d\n", score);
    return 0;
}
