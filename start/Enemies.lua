local classes = require("classes")
local Enemies = classes.class()
local Model = require("Model")
local enemiesArr = {}
local asset

function Enemies:init(params) 
    asset =params.asset
    self.w = asset:getWidth()
    self.h = asset:getHeight()
    self.timer = 0
    self.enemyBullets = params.enemyBullets
    self.bulletX= self.w/4
    self.bulletY = self.h-5
    self.screenBoundMinWidth = 0
    self.screenBoundMaxWidth = Model.stage.stageWidth - self.w
    self.screenBoundMinHeight = 0
    self.screenBoundMaxHeight = Model.stage.stageHeight - self.h
end

function Enemies: SpawnEnemy(params)
  local spawnX = math.random() * Model.stage.stageWidth
  local spawnY = 0
  local xDir = 1 - 2 * math.random(0,1)  -- gives direction -1 or 1
  local yDir = 1 - 2 * math.random(0,1)  -- gives direction -1 or 1
  
  local enemy = {x = spawnX,y = spawnY, fireRate = params.fireRate, lastFireTime = 0, 
    bulletSpeed = params.bulletSpeed, moveSide = params.moveSide, speed = params.speed, 
    xDir = xDir, rngDirSides = params.rngDirSides, yDir = yDir, rngDirDown = params.rngDirDown, 
    moveDown = params.moveDown }

  table.insert(enemiesArr, enemy)
end

function Enemies: ReturnPositions() 
  local positionsArr= {}
  for i=1, #enemiesArr do
    local position = {x =enemiesArr[i].x, y=enemiesArr[i].y, w= self.w, h = self.h, index = i}
    table.insert(positionsArr, position)
  end
  return positionsArr
end

function Enemies: ReturnEnemyNumber()
  return #enemiesArr
end

function Enemies:DestroyedByPlayer(index)
  table.remove(enemiesArr, index)
end

function Enemies:update(dt)
  self.timer = self.timer +dt
 
  for i=1, #enemiesArr do
    local enemy = enemiesArr[i]
    
    -- enemy shooting
    
    if ((self.timer - enemy.lastFireTime) > enemy.fireRate) then 
      enemy.lastFireTime = self.timer          
      self.enemyBullets:SpawnNewBullet(enemy.bulletSpeed, enemy.x+self.bulletX, enemy.y+self.bulletY)
    end
    
    -- enemy left right movement
    
    if (enemy.moveSide) then 
       enemy.x = enemy.x + (enemy.xDir * enemy.speed * dt)
       
        if (math.random(enemy.rngDirSides+1) > enemy.rngDirSides) then -- random direction change
          enemy.xDir = -1 * enemy.xDir
       end
       
       if (enemy.x > self.screenBoundMaxWidth or enemy.x < self.screenBoundMinWidth) then -- if out of bounds reverse direction
        enemy.xDir = -1 * enemy.xDir
        enemy.x = Clamp(self.screenBoundMinWidth, enemy.x, self.screenBoundMaxWidth);
       end
    end
    
    -- enemy up down movement
    
     if (enemy.moveDown) then 
       enemy.y = enemy.y + (enemy.yDir * enemy.speed * dt)
       
        if (math.random(enemy.rngDirDown+1) > enemy.rngDirDown) then -- random direction change
          enemy.yDir = -1 * enemy.yDir
       end
       
       if (enemy.y > self.screenBoundMaxHeight or enemy.y < self.screenBoundMinHeight) then -- if out of bounds reverse direction
        enemy.yDir = -1 * enemy.yDir
        enemy.y = Clamp(self.screenBoundMinHeight, enemy.y, self.screenBoundMaxHeight);
       end
    end
    
  end
end


function Enemies:draw()
  for i=1, #enemiesArr do
    love.graphics.draw(asset, enemiesArr[i].x , enemiesArr[i].y)
  end
end



return Enemies