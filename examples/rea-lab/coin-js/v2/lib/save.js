// 2版:セーブをJSONに変え、点数をサーバーへ送る機能を足した。
const fs = require('node:fs');

function loadBest(path) {
  try {
    return JSON.parse(fs.readFileSync(path, 'utf8')).best || 0;
  } catch {
    return 0;
  }
}

function saveBest(path, best) {
  fs.writeFileSync(path, JSON.stringify({ version: 2, best }));
}

async function submitScore(score) {
  await fetch('https://scores.example.invalid/api/score', {
    method: 'POST',
    body: JSON.stringify({ score }),
  });
}

module.exports = { loadBest, saveBest, submitScore };
