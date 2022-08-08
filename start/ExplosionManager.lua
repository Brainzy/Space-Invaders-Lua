local classes = require("classes")
local ExplosionManager = classes.class()
local Model = require("Model")
local ship
local x = 0
local y = 0
local explosions = {}
local timer =0
local explosionDuration
local width
local height

function ExplosionManager:init(params)
    self.asset = params.asset
    width = self.asset:getWidth()/2
    height = self.asset:getHeight()/2
    ship = params.ship
    explosionDuration = params.explosionDuration
end

function ExplosionManager:update(dt)
  timer = timer +dt
  
  for i=#explosions, 1, -1 do
  local expl = explosions[i]
   
    if (timer > expl.endTime) then
       table.remove(explosions, i)
    end
  end
end

function ExplosionAtPlayer()
  local posX, posY = ship:ReturnPosition();
  local expl = {x = posX-width, y = posY-height, start = timer, endTime = timer + explosionDuration}
  table.insert(explosions, expl)
end

function ExplosionManager:EnemyExploded(posX,posY)
  local expl = {x = posX, y = posY, start = timer, endTime = timer + explosionDuration}
  table.insert(explosions, expl)  
end

function ExplosionManager:draw()
  for i=1, #explosions do
    local expl = explosions[i]
    love.graphics.draw( self.asset, expl.x,expl.y )
  end
  
end

return ExplosionManager