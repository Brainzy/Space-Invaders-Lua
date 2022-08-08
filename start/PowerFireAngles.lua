local classes = require("classes")
local PowerFireAngles = classes.class()
local Model = require("Model")
local duration
local timer =0
local isActive = false

function PowerFireAngles:init(params)
  duration = params.duration
end

function PowerFireAnglesActivated()
  isActive = true
  timer = duration
  ChangeWeapon("altAngle")
end

function PowerFireAngles:update(dt)
  
  if (isActive) then    
    timer = timer -dt
    if(timer <= 0) then
      isActive = false
      ChangeWeapon("normal")
    end
  end
end

return PowerFireAngles