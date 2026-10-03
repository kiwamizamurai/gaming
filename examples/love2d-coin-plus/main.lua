local map = require("map")

local TILE = map.TILE
local PAD = 4
local BOX = TILE - PAD * 2
local SPEED = 240
local TIME_LIMIT = 30
local SAVE_FILE = "highscore.txt"

local sheet, quads, pickup
local player, coin, score, timeLeft, best

local function loadBest()
  if love.filesystem.getInfo(SAVE_FILE) then
    local text = love.filesystem.read(SAVE_FILE)
    return tonumber(text) or 0
  end
  return 0
end

local function placeCoin()
  local pc = math.floor((player.x + TILE / 2) / TILE)
  local pr = math.floor((player.y + TILE / 2) / TILE)
  local c, r = map.randomFloor(love.math.random, pc, pr)
  coin.x, coin.y = c * TILE, r * TILE
end

local function reset()
  player = { x = 9 * TILE, y = 5 * TILE }
  coin = { x = 0, y = 0 }
  score = 0
  timeLeft = TIME_LIMIT
  placeCoin()
end

local function isDown(key, padButton)
  if love.keyboard.isDown(key) then
    return true
  end
  local pad = love.joystick.getJoysticks()[1]
  return pad ~= nil and pad:isGamepad() and pad:isGamepadDown(padButton)
end

local function overlaps(ax, ay, aw, ah, bx, by, bw, bh)
  return ax < bx + bw and bx < ax + aw and ay < by + bh and by < ay + ah
end

local function finish()
  if score > best then
    best = score
    local ok, message = love.filesystem.write(SAVE_FILE, tostring(best))
    if not ok then
      print("save failed: " .. message)
    end
  end
end

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  sheet = love.graphics.newImage("tiles.png")
  quads = {}
  for i, name in ipairs({ "grass", "rock", "player", "coin" }) do
    quads[name] = love.graphics.newQuad((i - 1) * TILE, 0, TILE, TILE, sheet:getDimensions())
  end
  pickup = love.audio.newSource("coin.wav", "static")
  best = loadBest()
  reset()
end

function love.update(dt)
  if timeLeft <= 0 then
    return
  end
  timeLeft = timeLeft - dt
  if timeLeft <= 0 then
    timeLeft = 0
    finish()
    return
  end

  local dx, dy = 0, 0
  if isDown("left", "dpleft") then dx = dx - 1 end
  if isDown("right", "dpright") then dx = dx + 1 end
  if isDown("up", "dpup") then dy = dy - 1 end
  if isDown("down", "dpdown") then dy = dy + 1 end

  local nx = player.x + dx * SPEED * dt
  if not map.hitsWall(nx + PAD, player.y + PAD, BOX, BOX) then
    player.x = nx
  end
  local ny = player.y + dy * SPEED * dt
  if not map.hitsWall(player.x + PAD, ny + PAD, BOX, BOX) then
    player.y = ny
  end

  if overlaps(player.x + PAD, player.y + PAD, BOX, BOX, coin.x, coin.y, TILE, TILE) then
    score = score + 1
    pickup:stop()
    pickup:play()
    placeCoin()
  end
end

function love.draw()
  love.graphics.setColor(1, 1, 1)
  for r = 0, map.rows - 1 do
    for c = 0, map.cols - 1 do
      local name = map.isSolid(c, r) and "rock" or "grass"
      love.graphics.draw(sheet, quads[name], c * TILE, r * TILE)
    end
  end
  love.graphics.draw(sheet, quads.coin, coin.x, coin.y)
  love.graphics.draw(sheet, quads.player, player.x, player.y)
  love.graphics.setColor(0, 0, 0, 0.6)
  love.graphics.rectangle("fill", 0, 0, 640, 28)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(string.format("SCORE %d   BEST %d   TIME %d", score, best, math.ceil(timeLeft)), 40, 6)
  if timeLeft <= 0 then
    love.graphics.printf("TIME UP  Press Enter / A", 0, 220, 640, "center")
  end
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  elseif key == "return" and timeLeft <= 0 then
    reset()
  end
end

function love.gamepadpressed(_, button)
  if button == "a" and timeLeft <= 0 then
    reset()
  end
end
