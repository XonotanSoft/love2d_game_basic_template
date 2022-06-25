local no_x = 1
local no_y = 1
local no_x_f = 80
local no_y_f = 80
function no_game_draw(win_w, win_h)
  love.graphics.print("No Game", no_x, no_y)
  love.graphics.print(win_w, win_w*0.85, win_h*0.04)
  love.graphics.print("X", win_w*0.9, win_h*0.04)
  love.graphics.print(win_h, win_w*0.93, win_h*0.04)
end

function no_game_update(dt, win_w, win_h)
  no_x = no_x + no_x_f * dt
  no_y = no_y + no_y_f * dt
  if no_x >= win_w-60 or no_x <= 1 then
    no_x_f = no_x_f * -1
    love.audio.stop(sounds.colision)
    love.audio.play(sounds.colision)
  end
  if no_y >= win_h-20 or no_y <= 1 then
    no_y_f = no_y_f * -1
    love.audio.stop(sounds.colision)
    love.audio.play(sounds.colision)
  end
end
