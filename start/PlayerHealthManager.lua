local classes = require("classes")
local PlayerHealthManager = classes.class()
local Model = require("Model")
local health
local startingHealth

function PlayerHealthManager:init(params)
    self.ship= params.ship
    self.asset = params.asset
    health = params.health
    startingHealth = health
    self.picH = Model.stage.stageHeight-self.asset:getHeight()
    self.w= self.asset:getWidth()
end

function PlayerTookDamage(amount)
    health = health - 1
    if (health < 1) then
      PlayerLostLife()
      health = startingHealth
    end
end

function PlayerHealthManager:draw()
  for i=1, health do
    love.graphics.draw(self.asset,(i-1)*self.w, self.picH)
  end
end

return PlayerHealthManager