-- Saves to best.sav as 2 bytes (marker 0x4B, score), the same form as coin_term.c.
-- love.filesystem decides the location, which differs by device.
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
