local classes = require("classes")
local PlayerLivesManager = classes.class()
local Model = require("Model")
local lives
local lostGame = false

function PlayerLivesManager:init(params)
    lives = params.lives
    self.x = Model.stage.stageWidth-10
    self.y = Model.stage.stageHeight-20
    self.centerX = Model.stage.stageWidth/2-30
    self.centerY = Model.stage.stageHeight/2
end

function PlayerLostLife()
  lives = lives - 1
  if (lives < 1) then
    lostGame = true
    PauseGame()
  end
end

function PlayerLivesManager:draw()
  love.graphics.print(lives, self.x, self.y)
  if (lostGame) then
    love.graphics.print("YOU LOST", self.centerX, self.centerY)
  end
end

return PlayerLivesManager