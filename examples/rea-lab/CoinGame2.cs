// CoinGame.cs の「次の版」。更新でMODが壊れる様子を見るため、わざと形を変えている。
using System;
using System.IO;
using System.Runtime.InteropServices;

public class CoinGame {
    public const byte SaveMagic = 0x4B;
    public int X;
    public int Coin = 7;
    public long Score;          // int から long に変えた
    public int Lives = 3;       // 新しく足した

    public void Move(char key, int steps) {   // 歩数の引数を足した
        for (int i = 0; i < steps; i++) {
            if (key == 'a' && X > 0) X--;
            if (key == 'd' && X < 9) X++;
            if (X == Coin) {
                Score += 10;
                Coin = (Coin * 3 + 1) % 10;
            }
        }
    }

    public static void SaveBestScore(string path, long best) {  // 名前と型を変えた
        File.WriteAllBytes(path, new byte[] { SaveMagic, (byte)best });
    }

    [DllImport("libc", EntryPoint = "getpid")]
    static extern int GetProcessId();          // 機械語のライブラリを直接呼ぶ

    public static void Main() {
        var game = new CoinGame();
        game.Move('d', 7);
        Console.WriteLine("score=" + game.Score + " pid=" + GetProcessId());
    }
}
