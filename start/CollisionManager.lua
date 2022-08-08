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
  
  -- magnets collision
    
  local magnets = ReturnMagnets()
   for j=1, #magnets do
      local magnet = magnets[j]
      if (CheckCollision(x,y,w,h, magnet.x,  magnet.y, magnet.w, magnet.h)) then
          PlayerCollidingWithPowerUpMagnets(i)
          PowerMagnetActivated()
         return true
      end
   end
   
   -- shields collision
   
   local shields = ReturnShields()
   for j=1, #shields do
      local shield = shields[j]
      if (CheckCollision(x,y,w,h, shield.x,  shield.y, shield.w, shield.h)) then
          PlayerCollidingWithPowerUpShields(j)
          PowerShieldsActivated()
         return true
      end
   end
   
    -- fireAngles collision
   
   local fireAngles = ReturnFireAngles()
   for j=1, #fireAngles do
      local fireAngle = fireAngles[j]
      if (CheckCollision(x,y,w,h, fireAngle.x,  fireAngle.y, fireAngle.w, fireAngle.h)) then
         PlayerCollidingWithPowerUpFireAngles(j)
         PowerFireAnglesActivated()
         return true
      end
   end
   
   -- fireRates collision
   
   local fireRates = ReturnFireRates()
   for j=1, #fireRates do
      local fireRate = fireRates[j]
      if (CheckCollision(x,y,w,h, fireRate.x,  fireRate.y, fireRate.w, fireRate.h)) then
          PlayerCollidingWithPowerUpFireRate(j)
          PowerFireRateActivated()
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