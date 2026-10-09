-- best.sav に2バイト(目印0x4B、点数)で保存する。coin_term.c と同じ形。
-- 保存先は love.filesystem が決める(端末ごとに違う)。
local game = require("game")
local M = {}

function M.load()
  local data = love.filesystem.read("best.sav")
  if data and #data == 2 and data:byte(1) == game.SAVE_MAGIC then
    return data:byte(2)
  end
  return 0
end

function M.save(best)
  love.filesystem.write("best.sav", string.char(game.SAVE_MAGIC, best))
end

return M
