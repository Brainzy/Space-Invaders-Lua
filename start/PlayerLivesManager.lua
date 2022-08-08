local classes = require("classes")
local PlayerLivesManager = classes.class()
local Model = require("Model")
local lives
local lostGame = false

function PlayerLivesManager:init(params)
    lives = params.lives
    self.x = Model.stage.stageWidth-10
    self.y = Model.stage.stageHeight-20
end

function PlayerLostLife()
  lives = lives - 1
  ExplosionAtPlayer()
  PlayerLostLifeScoreEnter()
  if (lives < 1) then
    PlayerLostGame()
    PauseGame()
  end
end

function PlayerLivesManager:draw()
  love.graphics.print(lives, self.x, self.y)
end

return PlayerLivesManager