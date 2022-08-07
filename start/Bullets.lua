local classes = require("classes")
local Bullets = classes.class()
local Model = require("Model")
local bulletsArr = {}
local asset
local enemies

function Bullets:init(params) 
    asset = params.asset
    self.w = asset:getWidth()
    self.h = asset:getHeight()
    enemies = params.enemies
end

function Bullets:SpawnNewBullet(setSpeed,posX, posY)
  local bullet = {x = posX,y = posY, speed =  setSpeed}
  table.insert(bulletsArr, bullet)
end


function Bullets:update(dt)
  local enemyArr = enemies:ReturnPositions()
  
  for i=#bulletsArr, 1, -1 do --iterate backwards so its safe to remove out of bounds bullets
    bulletsArr[i].y = bulletsArr[i].y +(-1*bulletsArr[i].speed * dt)
    
    local removeThisBullet = false
    
    for j=1, #enemyArr do -- Is bullet colliding with enemy
      if (CheckCollision(bulletsArr[i].x, bulletsArr[i].y, self.w, self.h, enemyArr[j].x,  enemyArr[j].y, enemyArr[j].w, enemyArr[j].h)) then
         enemies:DestroyedByPlayer(enemyArr[j].index)
         removeThisBullet = true
      end
    end

    if (bulletsArr[i].y < 0) then -- bullet out of bounds
      removeThisBullet = true
    end
    
    if (removeThisBullet) then
      table.remove(bulletsArr, i)
    end
    
  end
end 


function Bullets:draw()
  for i=1, #bulletsArr do
    love.graphics.draw(asset, bulletsArr[i].x , bulletsArr[i].y)
  end
end

return Bullets