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
end

function Enemies: SpawnEnemy(params)
  local spawnX = math.random() * Model.stage.stageWidth
  local spawnY = 0
  local enemy = {x = spawnX,y = spawnY, fireRate = params.fireRate, lastFireTime = 0, bulletSpeed = params.bulletSpeed}
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

function Enemies:DestroyedByPlayer(index)
  table.remove(enemiesArr, index)
end

function Enemies:update(dt)
  self.timer = self.timer +dt
 
  for i=1, #enemiesArr do
    if ((self.timer - enemiesArr[i].lastFireTime) > enemiesArr[i].fireRate) then
      enemiesArr[i].lastFireTime = self.timer          
      self.enemyBullets:SpawnNewBullet(enemiesArr[i].bulletSpeed,enemiesArr[i].x+self.bulletX, enemiesArr[i].y+self.bulletY)
    end
  end
    
end

function Enemies:draw()
  for i=1, #enemiesArr do
    love.graphics.draw(asset, enemiesArr[i].x , enemiesArr[i].y)
  end
end



return Enemies