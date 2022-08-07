local classes = require("classes")
local Bullets = classes.class()
local Model = require("Model")
local bulletsArr = {}
local ship
local asset

function Bullets:init(params) 
    asset = params.asset
end

function Bullets:SpawnNewBullet(setSpeed,posX, posY)
  print(setSpeed)
  local bullet = {x = posX,y = posY, speed =  setSpeed}
  table.insert(bulletsArr, bullet)
end


function Bullets:update(dt)
  --for i = #t, 1, -1 do
  for i=#bulletsArr, 1, -1 do --iterate backwards so its safe to remove out of bounds bullets
    bulletsArr[i].y = bulletsArr[i].y +(-1*bulletsArr[i].speed * dt)
    
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