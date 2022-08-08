local classes = require("classes")
local PowerShields = classes.class()
local Model = require("Model")
local duration
local timer =0
local isActive = false

function PowerShields:init(params)
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

return PowerShields