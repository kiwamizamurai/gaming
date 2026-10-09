// コイン集めのルール。幅10マス、a/dで動き、コインを取ると10点。
const WIDTH = 10;

function createGame() {
  return { x: 0, coin: 7, score: 0 };
}

function move(game, key) {
  if (key === 'a' && game.x > 0) game.x--;
  if (key === 'd' && game.x < WIDTH - 1) game.x++;
  if (game.x === game.coin) {
    game.score += 10;
    game.coin = (game.coin * 3 + 1) % WIDTH;
  }
  return game;
}

module.exports = { WIDTH, createGame, move };
