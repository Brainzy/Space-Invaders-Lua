local classes = require("classes")
local Ship = classes.class()
local Model = require("Model")

function Ship:init(params)
    print("Ship init!")
    self.speed = params.speed
    self.asset = params.asset
    self.x = Model.stage.stageWidth / 2
    self.y = Model.stage.stageHeight / 2
    self.w = self.asset:getWidth()
    self.h = self.asset:getHeight()
    self.hw = self.w/2
    self.hh = self.h/2
    self.screenBoundMinWidth = self.hw
    self.screenBoundMaxWidth = Model.stage.stageWidth - self.hw
    self.screenBoundMinHeight = self.hh
    self.screenBoundMaxHeight = Model.stage.stageHeight - self.hh
end

function Ship:update(dt)

    local x = 0
    local y = 0

    if Model.movement.left then
        x = x + -1
    end
    if Model.movement.right then
        x = x + 1
    end

    if Model.movement.up then
        y = y + -1
    end
    if Model.movement.down then
        y = y + 1
    end
    
    self.x = self.x + (x * self.speed * dt)
    self.x = Clamp(self.screenBoundMinWidth, self.x, self.screenBoundMaxWidth);
    
    self.y = self.y + (y * self.speed * dt)
    self.y = Clamp(self.screenBoundMinHeight, self.y, self.screenBoundMaxHeight);
    
    CheckPlayerCollisionWithEnemies(self.x, self.y, self.w, self.h)
    
end

function Ship:draw()
    local newX = self.x - self.hw
    local newY = self.y - self.hh
    love.graphics.draw(self.asset, newX,newY )
end

function Ship:ReturnBulletSpawnPosition()
  return self.x-self.hw/2, self.y-self.hh
end

function Ship:ReturnPosition()
  return self.x, self.y
end

function Ship:ReturnWidthAndHeight()
  return self.h, self.w
end

return Ship