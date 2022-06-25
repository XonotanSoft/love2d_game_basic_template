--Libreries and Scripts
require "Scripts.no_game"
require "Scripts.save_load"
require "Scripts.Load_Media"
lume = require "Scripts.lume" --https://github.com/rxi/lume

function love.load(arg)
  --FPS
  min_dt = 1/60
  next_time = love.timer.getTime()
  --Coor of cursor
  cursor_x, cursor_y = love.mouse.getPosition()
  --Show cursor
  love.mouse.setVisible(false)
  --Window https://love2d.org/wiki/love.window
  win_with = 720
  win_hight = 480
  love.window.setMode(win_with, win_hight, {resizable=true, minwidth=500, minheight=150}) --https://love2d.org/wiki/love.window.setMode
  --load media
  sounds, cursor_s = load_media()
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
  --Gamesample
  no_game_update(dt,win_with,win_hight)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "s" then
    save_()
  elseif key == "d" then
    delete_()
  elseif key == "a" then --Update window
    love.window.updateMode(500, 150) --https://love2d.org/wiki/love.window.updateMode
    win_with = 500
    win_hight = 150
  end
end

function love.mousepressed(x, y, button, isTouch)
  love.audio.stop(sounds.click)
  love.audio.play(sounds.click)
end

function love.resize(w, h) --https://love2d.org/wiki/love.resize
  print(("Window resized to width: %d and height: %d."):format(w, h))
  win_with = w
  win_hight = h
end

function love.draw()
  no_game_draw(win_with, win_hight)
  love.graphics.draw(cursor_s, cursor_x, cursor_y)
  --FPS
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, win_hight*0.04)
  local cur_time = love.timer.getTime()
   if next_time <= cur_time then
      next_time = cur_time
      return
   end
   love.timer.sleep(next_time - cur_time)
end
