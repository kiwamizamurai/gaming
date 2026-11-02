// The "next version" of CoinGame.cs. Its shape is changed on purpose, to see how an update breaks mods.
using System;
using System.IO;
using System.Runtime.InteropServices;

public class CoinGame {
    public const byte SaveMagic = 0x4B;
    public int X;
    public int Coin = 7;
    public long Score;          // Changed from int to long
    public int Lives = 3;       // Newly added

    public void Move(char key, int steps) {   // Added a step count argument
        for (int i = 0; i < steps; i++) {
            if (key == 'a' && X > 0) X--;
            if (key == 'd' && X < 9) X++;
            if (X == Coin) {
                Score += 10;
                Coin = (Coin * 3 + 1) % 10;
            }
        }
    }

    public static void SaveBestScore(string path, long best) {  // Changed the name and types
        File.WriteAllBytes(path, new byte[] { SaveMagic, (byte)best });
    }

    [DllImport("libc", EntryPoint = "getpid")]
    static extern int GetProcessId();          // Calls a machine code library directly

    public static void Main() {
        var game = new CoinGame();
        game.Move('d', 7);
        Console.WriteLine("score=" + game.Score + " pid=" + GetProcessId());
    }
}
