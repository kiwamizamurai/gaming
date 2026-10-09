-- 4:3の画面。RG40XXHの640x480に合わせている(Novaは1280x960で、ちょうど2倍)
function love.conf(t)
  t.identity = "coin-love"
  t.window.title = "coin-love"
  t.window.width = 640
  t.window.height = 480
  t.window.resizable = false
end
