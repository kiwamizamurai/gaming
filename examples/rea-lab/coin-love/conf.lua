-- A 4:3 screen, matching the RG40XXH's 640x480 (the Nova's 1280x960 is exactly double)
function love.conf(t)
  t.identity = "coin-love"
  t.window.title = "coin-love"
  t.window.width = 640
  t.window.height = 480
  t.window.resizable = false
end
