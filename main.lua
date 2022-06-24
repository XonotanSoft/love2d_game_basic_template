--Librerias y Scripts
require "Scripts.no_game"
require "Scripts.save_load"
lume = require "Scripts.lume" --https://github.com/rxi/lume

function love.load(arg)
  --FPS
  min_dt = 1/60
  next_time = love.timer.getTime()
  --Coor of cursor
  cursor_x, cursor_y = love.mouse.getPosition()
  --Mostrar cursor
  love.mouse.setVisible(true)

  --Var samples
    int = 1
    float = 1.0
    string = "none"
    bool = false

  --Load game data
  if love.filesystem.getInfo("save_game.txt") then
    game_data = load_()
    --load data in variables
      int = game_data.int
      float = game_data.float
      string = game_data.string
      bool = game_data.bool
      print(int)
      print(float)
      print(string)
      print(bool)
  else

  end
end

function love.update(dt)
  --FPS
  next_time = next_time + min_dt

  --Coor of cursor
  cursor_x, cursor_y = love.mouse.getPosition()

  no_game_update(dt)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "s" then
    save_()
  elseif key == "d" then
    delete_()
  end
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
