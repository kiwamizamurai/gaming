local game = require("game")
local save = require("save")

local g, best

local function finish()
  if g.score > best then save.save(g.score) end
end

function love.load(args)
  g = game.new()
  best = save.load()
  -- Automatic test: pass the keys as an argument, as in love . selftest ddddddd
  if args[1] == "selftest" then
    print(game.row(g, best))
    for key in (args[2] or ""):gmatch(".") do
      if game.move(g, key) then print(game.row(g, best)) end
    end
    finish()
    print(string.format("bye score=%d", g.score))
    love.event.quit()
  end
end

function love.keypressed(key)
  if key == "q" or key == "escape" then finish(); love.event.quit() end
  game.move(g, key)
end

-- Gamepad (the D-pad on the RG40XXH or Nova). Not checked on real hardware.
function love.gamepadpressed(_, button)
  if button == "dpleft" then game.move(g, "a") end
  if button == "dpright" then game.move(g, "d") end
  if button == "back" or button == "start" then finish(); love.event.quit() end
end

function love.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.printf(game.row(g, best), 0, 200, love.graphics.getWidth(), "center")
  love.graphics.printf("a / d (or D-pad)  q: quit", 0, 260, love.graphics.getWidth(), "center")
end
