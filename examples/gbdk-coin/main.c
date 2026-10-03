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
