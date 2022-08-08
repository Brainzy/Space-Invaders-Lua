local classes = require("classes")
local CoinSpawner = classes.class()
local Model = require("Model")
local asset
local coins = {}
local timer = 0
local lastRollTime =0
local w
local h

function CoinSpawner:init(params)
  asset = params.asset
  self.rng = 100 - params.rng  -- every second rolls 0,100
  self.expiresAfter = params.expiresAfter
  w = asset:getWidth()
  h = asset:getHeight()
  self.spawnX= Model.stage.stageWidth - w
  self.spawnY= Model.stage.stageWidth - h
end

function CoinSpawner:update(dt)
  timer = timer +dt
  
  if (timer > lastRollTime + 1) then
    lastRollTime = timer
    if (math.random(0,100) > self.rng) then
      local coin = {x = math.random() * self.spawnX, y = math.random() * self.spawnY, startTime = timer, w = w, h = h }
      table.insert(coins, coin)
    end
  end
  
  for i = #coins, 1, -1 do
    local coin = coins[i]
    if ( timer > coin.startTime + self.expiresAfter) then
      table.remove(coins, i)
    end
  end
end

function CoinSpawner: ReturnCoins()
  return coins
 end 
 
 function CoinSpawner: CoinCollected(index)
   table.remove(coins, index)
  end 

function CoinSpawner:draw()
  for i=1, #coins do
    local coin = coins[i]
    love.graphics.draw(asset, coin.x, coin.y)
  end
end

return CoinSpawner