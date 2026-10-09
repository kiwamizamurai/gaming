using System;
using System.IO;

public class CoinGame {
    public const byte SaveMagic = 0x4B;
    public int X;
    public int Coin = 7;
    public int Score;

    public void Move(char key) {
        if (key == 'a' && X > 0) X--;
        if (key == 'd' && X < 9) X++;
        if (X == Coin) {
            Score += 10;
            Coin = (Coin * 3 + 1) % 10;
        }
    }

    public static void SaveBest(string path, int best) {
        File.WriteAllBytes(path, new byte[] { SaveMagic, (byte)best });
    }

    public static void Main() {
        var game = new CoinGame();
        foreach (var c in "ddddddd") game.Move(c);
        Console.WriteLine("score=" + game.Score);
    }
}
