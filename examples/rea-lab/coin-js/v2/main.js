const { createGame, move } = require('./lib/game');
const { loadBest, saveBest } = require('./lib/save');

const SAVE_PATH = 'best.sav';
const best = loadBest(SAVE_PATH);
const game = createGame();
for (const key of process.argv[2] || '') move(game, key);
if (game.score > best) saveBest(SAVE_PATH, game.score);
console.log(`score=${game.score} best=${best}`);
