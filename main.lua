--Librerias y Scripts
require "Scripts.no_game"
function love.load(arg)
  --FPS
  min_dt = 1/60
  next_time = love.timer.getTime()
  --Coordenas del cursor
  cursor_x, cursor_y = love.mouse.getPosition()
  --Mostrar cursor
  love.mouse.setVisible(true)
end

function love.update(dt)
  --FPS
  next_time = next_time + min_dt
  --Coordenas del cursor
  cursor_x, cursor_y = love.mouse.getPosition()

  no_game_update(dt)
end

function love.keypressed(key, scancode, isrepeat)
  -- body...
end

function love.mousepressed(x, y, button, isTouch)
  -- body...
end

function love.draw()
  no_game_draw()
  --FPS
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 11)
  local cur_time = love.timer.getTime()
   if next_time <= cur_time then
      next_time = cur_time
      return
   end
   love.timer.sleep(next_time - cur_time)
end
