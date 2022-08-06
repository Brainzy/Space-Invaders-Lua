local classes = require("classes")
local Ship = classes.class()
local Model = require("Model")
local screenBoundMinWidth
local screenBoundMaxWidth
local screenBoundMinHeight
local screenBoundMaxHeight

function Ship:init(params)
    print("Ship init!")
    self.speed = params.speed
    self.asset = params.asset
    self.x = Model.stage.stageWidth / 2
    self.y = Model.stage.stageHeight / 2
    self.w = self.asset:getWidth()
    self.h = self.asset:getHeight()
    screenBoundMinWidth = self.w/2
    screenBoundMaxWidth = Model.stage.stageWidth - self.w/2
    screenBoundMinHeight = self.h/2
    screenBoundMaxHeight = Model.stage.stageHeight - self.h/2
end

function Ship:update(dt)

    local left = Model.movement.left
    local right = Model.movement.right
    local up = Model.movement.up
    local down = Model.movement.down

    local x = 0
    local y = 0

    if left then
        x = x + -1
    end
    if right then
        x = x + 1
    end

    if up then
        y = y + -1
    end
    if down then
        y = y + 1
    end

    self.x = self.x + (x * self.speed * dt)
    self.x = Clamp(screenBoundMinWidth, self.x, screenBoundMaxWidth);
    
    self.y = self.y + (y * self.speed * dt)
    self.y = Clamp(screenBoundMinHeight, self.y, screenBoundMaxHeight);
end

function Clamp(min, val, max)
    return math.max(min, math.min(val, max));
end

function Ship:draw()
    local newX = self.x - (self.w/2)
    local newY = self.y - (self.h/2)
    love.graphics.draw(self.asset, newX,newY )
end

return Ship