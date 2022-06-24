function save_()
  local data_game = {
    string = "Love2D",
    int = 100,
    float = 11.4,
    bool = true
  }
  local serialize_ = lume.serialize(data_game)
  love.filesystem.write("save_game.txt", serialize_)
  print(serialize_)
  print("Game save :D")
end

function load_()
  local file_save = love.filesystem.read("save_game.txt")
  local deserialize_ = lume.deserialize(file_save)
  print("Game load :D")
  print("===========Data==========")
  return deserialize_
end

function delete_()
  love.filesystem.remove("save_game.txt")
  print("Game delete :(")
end
