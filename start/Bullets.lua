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
    self.xSpeed = params.xSpeed
end

function Bullets:SpawnNewBullet(setSpeed, bulletType, posX, posY)
  local bullet = {speed =  setSpeed, bulletType = bulletType, x = posX, y = posY}
  table.insert(bulletsArr, bullet)
  
  if (bulletType == "altAngle") then -- bullet from FireAnglesPowerUp
    bullet = {speed =  setSpeed, bulletType = "altLeft", x = posX - 10 , y = posY}
    table.insert(bulletsArr, bullet)
    bullet = {speed =  setSpeed, bulletType = "altRight",x = posX + 10 , y = posY }
    table.insert (bulletsArr, bullet)
  end
  
  if (bulletType == "tripleStraight") then -- bullet from FireRate power up
    bullet = {speed =  setSpeed, bulletType = "tripleStraight", x = posX - 30 , y = posY}
    table.insert(bulletsArr, bullet)
    bullet = {speed =  setSpeed, bulletType = "tripleStraight",x = posX + 30 , y = posY }
    table.insert (bulletsArr, bullet)
  end
  
end

function Bullets:update(dt)
  
  local enemyArr = enemies:ReturnPositions()
  
  for i=#bulletsArr, 1, -1 do --iterate backwards so its safe to remove out of bounds bullets
    local bullet = bulletsArr[i]
    
    bullet.y =bullet.y +(-1*bullet.speed * dt)
    
    if (bullet.bulletType == "altLeft") then
      bullet.x =bullet.x +(-1*self.xSpeed * dt)
    else if (bullet.bulletType == "altRight") then
      bullet.x =bullet.x +(1*self.xSpeed * dt)
    end
    
    local removeThisBullet = false
    
    for j=1, #enemyArr do -- Is bullet colliding with enemy
      local enemy = enemyArr[j]
      if (CheckCollision(bullet.x, bullet.y, self.w, self.h, enemy.x, enemy.y, enemy.w, enemy.h)) then
         enemies:DestroyedByPlayer(enemy.index)
         removeThisBullet = true
      end
    end

    if (bullet.y < 0) then -- bullet out of bounds
      removeThisBullet = true
    end
    
    if (removeThisBullet) then
      table.remove(bulletsArr, i)
    end
    
  end
end 
end

function Bullets:draw()
  for i=1, #bulletsArr do
    love.graphics.draw(asset, bulletsArr[i].x , bulletsArr[i].y)
  end
end

return Bullets