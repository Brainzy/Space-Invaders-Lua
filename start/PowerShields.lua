local classes = require("classes")
local PowerShields = classes.class()
local Model = require("Model")
local duration
local timer =0
local isActive = false
local asset

function PowerShields:init(params)
  asset = params.asset
  duration = params.duration
end

function PowerShieldsActivated()
  isActive = true
  timer = duration
end

function PowerShields:update(dt)
  
  if (isActive) then    
    timer = timer -dt
    if(timer <= 0) then
      isActive = false
      
    end
  end
end

function PowerShields:draw()
    --ship.x, ship.y = ship:ReturnPosition() 
    --if (isActive) then
     -- love.graphics.draw(asset, ship.x,ship.y )
    --end    
end

return PowerShields