local classes = require("classes")
local TimedPowerUpSpawner = classes.class()
local Model = require("Model")

local rngOnEnemyDeath
local greaterFireChance
local altAnglesChance
local shieldChance
local magnetChance
local powerUpFireRate
local powerUpFireRateDuration
local altAngleDuration
local shieldDuration
local magnetDuration
local fireAnglesAsset
local magnetAsset
local fireRateAsset
local shieldAsset

local fireAngleW
local fireAngleH
local fireRateW
local fireRateH
local magnetW
local magnetH
local shieldsW
local shieldsH

local fireAngles = {}
local fireRates = {}
local magnets = {}
local shields = {}

local timer = 0

function TimedPowerUpSpawner:init(params)
  rngOnEnemyDeath = params.rngOnEnemyDeath
  greaterFireChance = params.greaterFireChance
  shieldChance = params.shieldChance
  magnetChance = params.magnetChance
  powerUpFireRate = params.powerUpFireRate
  powerUpFireRateDuration = params.powerUpFireRateDuration
  altAngleDuration = params.altAngleDuration
  shieldDuration = params.shieldDuration
  magnetDuration = params.magnetDuration
  altAnglesChance = params.altAnglesChance
  fireAnglesAsset = params.fireAnglesAsset
  magnetAsset = params.magnetAsset
  fireRateAsset = params.fireRateAsset
  shieldAsset = params.shieldAsset
  
  fireAngleW = fireAnglesAsset:getWidth()+20
  fireAngleH = fireAnglesAsset:getHeight()+20
  fireRateW = fireRateAsset:getWidth() +20
  fireRateH = fireRateAsset:getHeight() +20
  magnetW = magnetAsset:getWidth()
  magnetH = magnetAsset:getHeight()
  shieldsW = shieldAsset:getWidth()
  shieldsH = shieldAsset:getHeight()
end

function EnemyDiedPowerUpSpawnCheck(x,y)
  
  if (math.random(100) < rngOnEnemyDeath) then -- roll success will spawn something
    
    local rng = math.random(100)
          
    if (0 <= rng and rng <= greaterFireChance) then
      local item = {asset = fireRateAsset, x = x + fireRateW/2, y = y+fireRateH/2, endTime = timer + powerUpFireRateDuration, w = fireRateW, h = fireRateH}
      table.insert(fireRates, item)
     
    else if (greaterFireChance <= rng and rng <= greaterFireChance+shieldChance) then
      local item = {asset = shieldAsset, x = x, y = y, endTime = timer + shieldDuration, w = shieldsW, h = shieldsH}
      table.insert(shields, item)
      
    else if (greaterFireChance+shieldChance <= rng and rng <= greaterFireChance+shieldChance+magnetChance) then
      local item = {magnets, asset = magnetAsset, x = x, y = y, endTime = timer + magnetDuration, w = magnetW, h = magnetH}
      table.insert(magnets, item)
      
    else
      local item = {asset = fireAnglesAsset, x = x + fireRateW/2, y = y +fireRateH/2, endTime = timer + powerUpFireRateDuration, w = fireAngleW, h = fireAngleH}
      table.insert(fireAngles, item)
      
    end
  end
end
end
end

function ReturnFireRates()
  return fireRates
end

function ReturnFireAngles()
  return fireAngles
end

function ReturnShields()
  return shields
end

function ReturnMagnets()
  return magnets
end

function PlayerCollidingWithPowerUpFireRate(i)
  table.remove(fireRates, i)
end

function PlayerCollidingWithPowerUpMagnets(i)
  table.remove(magnets, i)
end

function PlayerCollidingWithPowerUpShields(i)
  table.remove(shields, i)
end

function PlayerCollidingWithPowerUpFireAngles(i)
  table.remove(fireAngles, i)
end

function TimedPowerUpSpawner:update(dt)
  
  timer = timer +dt
  
  for i=#fireAngles, 1, -1 do
   local fireAngle = fireAngles[i]
   if (timer > fireAngle.endTime) then
     table.remove(fireAngles, i)
   end     
  end
  
   for i=#fireRates, 1, -1 do
   local fireRate = fireRates[i]
   if (timer > fireRate.endTime) then
     table.remove(fireRates, i)
   end     
  end
  
   for i=#magnets, 1, -1 do
   local magnet = magnets[i]
   if (timer > magnet.endTime) then
     table.remove(magnets, i)
   end     
  end
  
   for i=#shields, 1, -1 do
   local shield = shields[i]
   if (timer > shield.endTime) then
     table.remove(shields, i)
   end     
  end
  
end

function TimedPowerUpSpawner:draw()
  for i=#fireAngles, 1, -1 do
    item = fireAngles[i]
    love.graphics.draw(item.asset, item.x, item.y)
  end
  
  for i=#fireRates, 1, -1 do
    item = fireRates[i]
    love.graphics.draw(item.asset, item.x, item.y)
  end
  
  for i=#magnets, 1, -1 do
    item = magnets[i]
    love.graphics.draw(item.asset, item.x, item.y)
  end
  
  for i=#shields, 1, -1 do
    item = shields[i]
    love.graphics.draw(item.asset, item.x, item.y)
  end
end

return TimedPowerUpSpawner