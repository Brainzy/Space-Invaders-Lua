local classes = require("classes")
local CollisionManager = classes.class()
local Model = require("Model")
local enemies

function CollisionManager:init(params) 
    enemies = params.enemies
    self.ship = params.ship
end

function CheckPlayerCollisionWithEnemies(x,y,w,h)
  local enemyArr = enemies:ReturnPositions()
     for j=1, #enemyArr do
      if (CheckCollision(x,y,w,h, enemyArr[j].x,  enemyArr[j].y, enemyArr[j].w, enemyArr[j].h)) then
         enemies:DestroyedByPlayer(enemyArr[j].index)
         PlayerTookDamage(1)
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