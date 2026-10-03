local M = {}

M.TILE = 32

local rows = {
  "####################",
  "#..................#",
  "#..................#",
  "#....##......##....#",
  "#....##......##....#",
  "#..................#",
  "#..................#",
  "#........##........#",
  "#........##........#",
  "#..................#",
  "#..................#",
  "#....##......##....#",
  "#....##......##....#",
  "#..................#",
  "####################",
}

M.cols = #rows[1]
M.rows = #rows

function M.isSolid(col, row)
  if col < 0 or row < 0 or col >= M.cols or row >= M.rows then
    return true
  end
  return rows[row + 1]:sub(col + 1, col + 1) == "#"
end

function M.hitsWall(x, y, w, h)
  local c1 = math.floor(x / M.TILE)
  local c2 = math.floor((x + w - 1) / M.TILE)
  local r1 = math.floor(y / M.TILE)
  local r2 = math.floor((y + h - 1) / M.TILE)
  for r = r1, r2 do
    for c = c1, c2 do
      if M.isSolid(c, r) then
        return true
      end
    end
  end
  return false
end

function M.randomFloor(random, avoidCol, avoidRow)
  while true do
    local c = random(0, M.cols - 1)
    local r = random(0, M.rows - 1)
    if not M.isSolid(c, r) and not (c == avoidCol and r == avoidRow) then
      return c, r
    end
  end
end

return M
