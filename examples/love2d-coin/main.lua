local SIZE = 32
local SPEED = 240
local TIME_LIMIT = 30

local player, coin, score, timeLeft

local function placeCoin()
  coin.x = love.math.random(0, 640 - SIZE)
  coin.y = love.math.random(0, 480 - SIZE)
end

local function reset()
  player = { x = 304, y = 224 }
  coin = { x = 100, y = 100 }
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

local function overlaps(a, b)
  return a.x < b.x + SIZE and b.x < a.x + SIZE
     and a.y < b.y + SIZE and b.y < a.y + SIZE
end

function love.load()
  reset()
end

function love.update(dt)
  if timeLeft <= 0 then
    return
  end
  timeLeft = timeLeft - dt

  local dx, dy = 0, 0
  if isDown("left", "dpleft") then dx = dx - 1 end
  if isDown("right", "dpright") then dx = dx + 1 end
  if isDown("up", "dpup") then dy = dy - 1 end
  if isDown("down", "dpdown") then dy = dy + 1 end

  player.x = math.max(0, math.min(640 - SIZE, player.x + dx * SPEED * dt))
  player.y = math.max(0, math.min(480 - SIZE, player.y + dy * SPEED * dt))

  if overlaps(player, coin) then
    score = score + 1
    placeCoin()
  end
end

function love.draw()
  love.graphics.setColor(1, 0.85, 0.1)
  love.graphics.rectangle("fill", coin.x, coin.y, SIZE, SIZE)
  love.graphics.setColor(0.2, 0.7, 1)
  love.graphics.rectangle("fill", player.x, player.y, SIZE, SIZE)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(string.format("SCORE %d   TIME %d", score, math.max(0, math.ceil(timeLeft))), 10, 10)
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
