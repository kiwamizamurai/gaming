# rea-lab

These are the experiment files used in [article 22](../../articles/22-rea-hands-on.md) through [article 24](../../articles/24-android-nova.md). All of them were written by the author for this series. The experiments were run on x86_64 Ubuntu 24.04.

| File | Contents | Used in |
|---|---|---|
| `coin_term.c` | A coin-collecting game played in the terminal (C). Saves the high score as 2 bytes in `best.sav` | Articles 22, 23 |
| `coin_rebuild.py` | A Python version rebuilt by looking only at recordings of the behavior. Behavior at walls was written by guesswork and differs from the original | Article 22 |
| `CoinGame.cs` | Version 1 of the .NET (C#) edition | Article 22 |
| `CoinGame2.cs` | Version 2 of the same game. Types, arguments, names, and machine code library calls were deliberately changed | Article 22 |
| `coin-js/v1`, `coin-js/v2` | Two versions of the Node.js edition. Version 2 changes saving to JSON and adds a communication destination (a name that does not exist) | Article 22 |
| `DecompAt.java` | A Ghidra script. Creates a function at the specified address if there is none, and outputs pseudocode | Article 23 |
| `DecompByName.java` | A Ghidra script. Finds a function by name and outputs pseudocode | Article 23 |
| `coin-love/` | The LÖVE version of the coin-collecting game. `love coin-love selftest ddddddd` runs a test without a screen | Article 24 |
| `android-love.sh` | Steps for reading the Android APK of LÖVE with REA | Article 24 |

## Building and running

```sh
# C version (x86_64)
gcc -O1 -o coin_term coin_term.c
# C version (aarch64, statically linked). Running it requires qemu-aarch64
aarch64-linux-gnu-gcc -O1 -static -o coin_term-aarch64 coin_term.c

# C# version
mcs -out:CoinGame.exe CoinGame.cs

# JavaScript version
node coin-js/v1/main.js ddddddd

# LÖVE version (game files: main.lua goes at the top level of the zip)
cd coin-love && zip -r -X ../coin-love.love conf.lua game.lua main.lua save.lua && cd ..
love coin-love.love
```

## Notes

- The APK read by `android-love.sh` is LÖVE's official distribution. It is not included in this repository. REA's Android commands require Java 17 or later and the JAR of `jadx-headless-mcp` 0.7.1 ([REA documentation](https://github.com/morluto/rea/blob/472b72a53068a8e2ec78fe239d687023482daaa7/docs/android-analysis.md)).
- Running `coin_term` with `capture-process` runs it with the permissions of the person running it. As the REA documentation says, this is not a sandbox.
