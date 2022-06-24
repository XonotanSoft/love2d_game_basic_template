local no_x = 1
local no_y = 1
local no_x_f = 80
local no_y_f = 80
function no_game_draw()
  love.graphics.print("No Game", no_x, no_y)
end

function no_game_update(dt)
  no_x = no_x + no_x_f * dt
  no_y = no_y + no_y_f * dt
  if no_x > 660 or no_x < 1 then
    no_x_f = no_x_f * -1
  end
  if no_y > 460 or no_y < 1 then
    no_y_f = no_y_f * -1
  end
end
