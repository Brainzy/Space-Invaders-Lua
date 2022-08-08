local classes = require("classes")
local CollisionManager = classes.class()
local Model = require("Model")
local enemies
local coinSpawner

function CollisionManager:init(params) 
    enemies = params.enemies
    coinSpawner = params.coinSpawner
    self.ship = params.ship
    healthPackSpawner= params.healthPackSpawner
end

function CheckPlayerCollisionWithEnemies(x,y,w,h)
  
  --enemy collision
  
  local enemyArr = enemies:ReturnPositions()
     for j=1, #enemyArr do
      local enemy = enemyArr[j]
      if (CheckCollision(x,y,w,h, enemy.x,  enemy.y, enemy.w, enemy.h)) then
         enemies:DestroyedByPlayer(enemy.index)
         PlayerTookDamage(1)
         return true
      end
    end
  
  -- coin collision
    
  local coins = coinSpawner:ReturnCoins()
   for j=1, #coins do
      local coin = coins[j]
      if (CheckCollision(x,y,w,h, coin.x,  coin.y, coin.w, coin.h)) then
          coinSpawner:CoinCollected(j)
          PlayerCollectedCoinScoreEnter()
         return true
      end
    end
  
  -- healthPacks collision
    
  local packs = healthPackSpawner:ReturnHealthPacks()
   for j=1, #packs do
      local pack = packs[j]
      if (CheckCollision(x,y,w,h, pack.x,  pack.y, pack.w, pack.h)) then
          healthPackSpawner:HealthPackCollected(j)
          PlayerCollectedHealthPack(1)
         return true
      end
    end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

return CollisionManager