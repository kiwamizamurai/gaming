-- コイン集めのルール。coin_term.c と同じ。画面にも、ターミナルにも依存しない。
local M = {}

M.WIDTH = 10
M.SAVE_MAGIC = 0x4B

function M.new()
  return { x = 0, coin = 7, score = 0 }
end

function M.move(g, key)
  if key ~= "a" and key ~= "d" then return false end
  if key == "a" and g.x > 0 then g.x = g.x - 1 end
  if key == "d" and g.x < M.WIDTH - 1 then g.x = g.x + 1 end
  if g.x == g.coin then
    g.score = g.score + 10
    g.coin = (g.coin * 3 + 1) % M.WIDTH
    if g.coin == g.x then g.coin = (g.coin + 1) % M.WIDTH end
  end
  return true
end

-- 1行の文字にする。coin_term.c の draw() と同じ形。
function M.row(g, best)
  local cells = {}
  for i = 0, M.WIDTH - 1 do cells[i] = "." end
  cells[g.coin] = "$"
  cells[g.x] = "@"
  return string.format("[%s] score=%d best=%d", table.concat(cells, "", 0, M.WIDTH - 1), g.score, best)
end

return M
