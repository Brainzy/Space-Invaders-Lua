local classes = require("classes")
local PowerShields = classes.class()
local Model = require("Model")
local duration
local timer =0
local isActive = false
local asset
local ship
local shields = {}

function PowerShields:init(params)
  asset = params.asset
  duration = params.duration
  ship = params.ship
  self.shieldAmount = params.shieldAmount
  
  for i=1, self.shieldAmount do -- initialize shields
    local shield = {x,y, angle = 360/self.shieldAmount*i}
    print(shield.angle)
    table.insert(shields, shield)
  end 
end

function PowerShieldsActivated()
  isActive = true
  timer = duration
end

function PowerShields:update(dt)
  
  if (isActive) then    
    timer = timer -dt
    
    for i=1, #shields do
      local shield = shields[i]
      ship.x, ship.y = ship:ReturnPosition() 
      shield.angle = shield.angle + (math.pi * dt) 
      shield.x = ship.x-10 + 50 * (math.cos(shield.angle)) 
      shield.y = ship.y-10 + 50 * (math.sin(shield.angle))
    end
    
    if(timer <= 0) then
      isActive = false      
    end
  end
end


function AreShieldsActive()
  return isActive
end


function PowerShields:draw()
    if (isActive) then
      for i=1, #shields do
        local shield = shields[i]
        love.graphics.draw(asset, shield.x, shield.y, 0 ,0.5, 0.5)
      end
     
    end    
end

return PowerShields