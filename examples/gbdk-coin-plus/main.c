#include <gb/gb.h>
#include <gbdk/console.h>
#include <rand.h>
#include <stdint.h>
#include <stdio.h>

#include "tiles.h"

#define FLOOR 128
#define WALL 129
#define PLAYER 130
#define COIN 131

#define COLS 20
#define ROWS 18
#define TIME_LIMIT 30u

#define SAVE_MAGIC 0x4B
#define SPEED 2

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

static uint8_t map[COLS * ROWS];
static uint8_t px, py, cx, cy;
static uint8_t score, best;
static uint16_t frames_left;

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

static void draw_map(void) {
    uint8_t col, row;
    for (row = 0; row < ROWS; row++) {
        for (col = 0; col < COLS; col++) {
            map[row * COLS + col] = (row > 0 && solid(col, row)) ? WALL : FLOOR;
        }
    }
    set_bkg_tiles(0, 0, COLS, ROWS, map);
}

static void place_coin(void) {
    uint8_t col, row;
    do {
        col = rand() % COLS;
        row = rand() % ROWS;
    } while (solid(col, row) || (col == (px >> 3) && row == (py >> 3)));
    cx = col << 3;
    cy = row << 3;
}

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

static void put_num(uint8_t x, uint8_t width, uint8_t v) {
    uint8_t digits = (v >= 100) ? 3 : (v >= 10) ? 2 : 1;
    gotoxy(x, 0);
    while (width-- > digits) {
        putchar(' ');
    }
    printf("%u", (unsigned int)v);
}

static void show_hud(void) {
    put_num(2, 3, score);
    put_num(10, 3, best);
    put_num(18, 2, (uint8_t)((frames_left + 59u) / 60u));
}

static void new_game(void) {
    draw_map();
    px = 80;
    py = 40;
    score = 0;
    frames_left = TIME_LIMIT * 60u;
    place_coin();
    gotoxy(0, 0);
    printf("SC");
    gotoxy(6, 0);
    printf("BEST");
    gotoxy(14, 0);
    printf("TIME");
    show_hud();
}

void main(void) {
    uint8_t keys, nx, ny;

    set_bkg_data(FLOOR, tiles_TILE_COUNT, tiles_tiles);
    set_sprite_tile(0, PLAYER);
    set_sprite_tile(1, COIN);
    SHOW_BKG;
    SHOW_SPRITES;

    load_best();
    gotoxy(4, 8);
    printf("PRESS START");
    waitpad(J_START);
    initrand(DIV_REG);
    waitpadup();
    new_game();

    while (1) {
        if (frames_left > 0) {
            keys = joypad();
            nx = px;
            ny = py;
            if (keys & J_LEFT) nx -= SPEED;
            if (keys & J_RIGHT) nx += SPEED;
            if (keys & J_UP) ny -= SPEED;
            if (keys & J_DOWN) ny += SPEED;
            if (!hits_wall(nx, py)) px = nx;
            if (!hits_wall(px, ny)) py = ny;

            if (px + 6 > cx && cx + 7 > px + 1 && py + 6 > cy && cy + 7 > py + 1) {
                score++;
                beep();
                place_coin();
            }

            frames_left--;
            if (frames_left == 0 && score > best) {
                best = score;
                save_best();
            }
            show_hud();
            if (frames_left == 0) {
                gotoxy(6, 8);
                printf("TIME UP");
                gotoxy(4, 10);
                printf("PRESS START");
            }
        } else if (joypad() & J_START) {
            waitpadup();
            new_game();
        }

        move_sprite(0, px + 8, py + 16);
        move_sprite(1, cx + 8, cy + 16);
        vsync();
    }
}
