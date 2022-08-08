local classes = require("classes")
local PowerFireRate = classes.class()
local Model = require("Model")
local duration
local timer =0
local isActive = false

function PowerFireRate:init(params)
  duration = params.duration
end

function PowerFireRateActivated()
  isActive = true
  timer = duration
  ChangeWeapon("tripleStraight")
end

function PowerFireRate:update(dt)
  
  if (isActive) then    
    timer = timer -dt
    if(timer <= 0) then
      isActive = false
       ChangeWeapon("normal")
    end
  end
end

return PowerFireRate