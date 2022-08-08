local classes = require("classes")
local EnemyBullets = classes.class()
local Model = require("Model")
local bulletsArr = {}
local asset
local ship

function EnemyBullets:init(params) 
    asset = params.asset
    self.w = asset:getWidth()
    self.h = asset:getHeight()
    ship = params.ship
    self.shipW, self.shipH = ship:ReturnWidthAndHeight()
end

function EnemyBullets:SpawnNewBullet(setSpeed,posX, posY)
  local bullet = {x = posX,y = posY, speed =  setSpeed}
  table.insert(bulletsArr, bullet)
end

function EnemyBullets:update(dt)
  
  local shipX,shipY = ship:ReturnPosition()
  
  for i=#bulletsArr, 1, -1 do --iterate backwards so its safe to remove out of bounds bullets
    bulletsArr[i].y = bulletsArr[i].y +(bulletsArr[i].speed * dt)
    
    local removeThisBullet = false
  
     if (AreShieldsActive()) then -- collision check against larger rectangle than ship
       if (CheckCollision(bulletsArr[i].x, bulletsArr[i].y, self.w, self.h, shipX,  shipY, self.shipW+50, self.shipH+80)) then
         removeThisBullet = true
       end
     else -- bullet vs player collision check
        if (CheckCollision(bulletsArr[i].x, bulletsArr[i].y, self.w, self.h, shipX,  shipY, self.shipW, self.shipH)) then
         PlayerTookDamage(1)
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


function EnemyBullets:draw()
  for i=1, #bulletsArr do
    love.graphics.draw(asset, bulletsArr[i].x , bulletsArr[i].y,0,1,-1)
  end
end

return EnemyBullets