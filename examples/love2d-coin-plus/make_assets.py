import math
import struct
import wave

from PIL import Image

PALETTE = {
    ".": (0, 0, 0, 0),
    "g": (88, 168, 64, 255),
    "d": (64, 136, 48, 255),
    "s": (120, 120, 128, 255),
    "h": (176, 176, 184, 255),
    "k": (72, 72, 80, 255),
    "b": (51, 179, 255, 255),
    "w": (255, 255, 255, 255),
    "n": (30, 90, 160, 255),
    "y": (255, 217, 26, 255),
    "o": (200, 140, 10, 255),
}

TILES = [
    [
        "gggggggg",
        "gggdgggg",
        "gggggggg",
        "ggggggdg",
        "gdgggggg",
        "gggggggg",
        "gggggdgg",
        "gggggggg",
    ],
    [
        "hhhhhhhk",
        "hsssssss",
        "hssssshk",
        "hsssssss",
        "hsshsssk",
        "hsssssss",
        "hsssssss",
        "kkkkkkkk",
    ],
    [
        "..bbbb..",
        ".bbbbbb.",
        ".bwbbwb.",
        ".bbbbbb.",
        "..nnnn..",
        ".bbbbbb.",
        ".bb..bb.",
        ".nn..nn.",
    ],
    [
        "..oooo..",
        ".oyyyyo.",
        "oyyoooyo",
        "oyyoyyyo",
        "oyyoyyyo",
        "oyyoooyo",
        ".oyyyyo.",
        "..oooo..",
    ],
]

SCALE = 4
sheet = Image.new("RGBA", (8 * SCALE * len(TILES), 8 * SCALE))
for index, rows in enumerate(TILES):
    for y, row in enumerate(rows):
        for x, ch in enumerate(row):
            block = Image.new("RGBA", (SCALE, SCALE), PALETTE[ch])
            sheet.paste(block, ((index * 8 + x) * SCALE, y * SCALE))
sheet.save("tiles.png")

RATE = 22050
LENGTH = 0.15
frames = bytearray()
phase = 0.0
for i in range(int(RATE * LENGTH)):
    t = i / RATE
    freq = 880 + (1320 - 880) * (t / LENGTH)
    phase += 2 * math.pi * freq / RATE
    amp = 0.4 * (1 - t / LENGTH)
    frames += struct.pack("<h", int(32767 * amp * math.sin(phase)))
with wave.open("coin.wav", "wb") as f:
    f.setnchannels(1)
    f.setsampwidth(2)
    f.setframerate(RATE)
    f.writeframes(bytes(frames))
