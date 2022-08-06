local Model = require("Model")
local Stars = classes.class()
local screenBoundMaxHeight
local stageWidth

function Stars:init(params)
    print("Stars init!")
    self.speed = params.speed
    self.radius = params.radius
    local numStars = params.numStars
    stageWidth= Model.stage.stageWidth
    local stageHeight = Model.stage.stageHeight
    local starsArr = {}
    for i=1, numStars do
        local x = math.random() * stageWidth
        local y = math.random() * stageHeight
        local star = {x = x,y = y}
        table.insert(starsArr, star)
    end
    self.numStars = numStars
    self.starsArr = starsArr
    screenBoundMaxHeight= Model.stage.stageHeight
end


function Stars:update(dt)
    
    for i=1, self.numStars do
      local newYPosition = self.starsArr[i].y+ (self.speed * dt);
           
      if (newYPosition > screenBoundMaxHeight) then
          newYPosition= 0
          self.starsArr[i].x = math.random() * stageWidth
      end
          
      self.starsArr[i].y= newYPosition
      
    end
end
function Stars:draw()
    love.graphics.setColor(1, 1, 1)
    local radius = self.radius
    local starsArr = self.starsArr
    local numStars = self.numStars
    for i=1, numStars do
        local star = starsArr[i]
        love.graphics.circle("fill", star.x, star.y, radius) -- Draw white circle with 100 segments.
    end
    
    
end





return Stars