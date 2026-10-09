// 最高点を best.sav に2バイト(目印0x4B、点数)で保存する。
const fs = require('node:fs');
const SAVE_MAGIC = 0x4b;

function loadBest(path) {
  try {
    const b = fs.readFileSync(path);
    return b.length === 2 && b[0] === SAVE_MAGIC ? b[1] : 0;
  } catch {
    return 0;
  }
}

function saveBest(path, best) {
  fs.writeFileSync(path, Buffer.from([SAVE_MAGIC, best]));
}

module.exports = { loadBest, saveBest };
