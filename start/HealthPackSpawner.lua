local classes = require("classes")
local HealthPackSpawner = classes.class()
local Model = require("Model")
local asset
local healthPacks = {}
local timer = 0
local lastRollTime =0
local w
local h

function HealthPackSpawner:init(params)
  asset = params.asset
  self.rng = 100 - params.rng  -- every second rolls 0,100
  self.expiresAfter = params.expiresAfter
  w = asset:getWidth()
  h = asset:getHeight()
  self.spawnX= Model.stage.stageWidth - w
  self.spawnY= Model.stage.stageWidth - h
end

function HealthPackSpawner:update(dt)
  timer = timer +dt
  
  if (timer > lastRollTime + 1) then
    lastRollTime = timer
    if (math.random(0,100) > self.rng) then
      local pack = {x = math.random() * self.spawnX, y = math.random() * self.spawnY, startTime = timer, w = w, h = h }
      table.insert(healthPacks, pack)
    end
  end
  
  for i = #healthPacks, 1, -1 do
    local pack = healthPacks[i]
    if ( timer > pack.startTime + self.expiresAfter) then
      table.remove(healthPacks, i)
    end
  end
end

function HealthPackSpawner: ReturnHealthPacks()
  return healthPacks
 end 
 
 function HealthPackSpawner: HealthPackCollected(index)
   table.remove(healthPacks, index)
  end 

function HealthPackSpawner:draw()
  for i=1, #healthPacks do
    local pack = healthPacks[i]
    love.graphics.draw(asset, pack.x, pack.y)
  end
end

return HealthPackSpawner