// Version 2: the save is now JSON, and a function that sends the score to a server was added.
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
