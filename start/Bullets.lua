local classes = require("classes")
local Bullets = classes.class()
local Model = require("Model")
local bulletsArr = {}
local asset;
local ship;

function Bullets:init(params) 
    asset = params.asset
    self.speed = params.speed
end

function Bullets:SpawnNewBullet(posX, posY)
  local bullet = {x = posX,y = posY}
  table.insert(bulletsArr, bullet)
end


function Bullets:update(dt)
  --for i = #t, 1, -1 do
  for i=#bulletsArr, 1, -1 do --iterate backwards so its safe to remove out of bounds bullets
    bulletsArr[i].y = bulletsArr[i].y +(-1*self.speed * dt)
    
    if (bulletsArr[i].y < 0) then
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