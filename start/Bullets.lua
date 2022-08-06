local classes = require("classes")
local Bullets = classes.class()
local Model = require("Model")

function Bullets:init(params)
    print("Bullets init!")
    
end

function Bullets:update(dt)
  
   local space = Model.movement.space
   
  if space then
       print("is pressing space")
  end
   
end

function Bullets:draw()
    
end

return Bullets