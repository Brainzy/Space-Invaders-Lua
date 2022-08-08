local classes = require("classes")
local EnemySpawner = classes.class()
local Model = require("Model")
local timer= 0;
local currentLevel = 1
local currentLevelDuration = 0
local levelParams = {}
local allLevels = {}
local maxLevel = 0

function EnemySpawner:init(params)
    self.enemies = params.enemies
    self.waveParams = params.waveParams
    spawnTimer = 2
    allLevels = self.waveParams: GetAllLevels()
    EnemySpawner:MakeCurrentLevelParams()
    self.centerX = Model.stage.stageWidth/2-30
    self.centerY = Model.stage.stageHeight/2
end


function EnemySpawner:MakeCurrentLevelParams()
  
  levelParams= {}
  
  for i=1, #allLevels do
    local lvl = allLevels[i]
    
    print("pravim novu tabelu nivo je ", lvl.level)     
    
    if (lvl.level == currentLevel) then
      
      local lvlParam = {start = lvl.start + timer , endTime = lvl.endTime + timer, interval = lvl.interval, lastSpawn = 0, enemy = lvl.enemy}
      table.insert( levelParams, lvlParam )
      
      if (lvl.endTime > currentLevelDuration) then
        currentLevelDuration = lvl.endTime
      end
      
      if (lvl.level > maxLevel) then
        maxLevel = lvl.level
      end
      
    end
  end
  
  for i=1, #levelParams do
   local lvl = levelParams[i]
   print(lvl.start, lvl.endTime, lvl.interval, lvl.lastSpawn, lvl.enemy)
  end
  
end

function EnemySpawner:update(dt)
  
  timer = timer + dt
  
  for i=1, #levelParams do
    local lvl = levelParams[i]
    
    if (lvl) then
      if (lvl.start <= timer  and timer <= lvl.endTime and timer - lvl.lastSpawn >= lvl.interval) then
        lvl.lastSpawn = timer
        self.enemies:SpawnEnemy(lvl.enemy)
      end
  
      if (timer > currentLevelDuration) then
        if (self.enemies:ReturnEnemyNumber() == 0) then
          print("level ended")
          currentLevel = currentLevel +1
          
          if (currentLevel >= maxLevel) then
            print("game won")
          else
            EnemySpawner:MakeCurrentLevelParams()
          end
        end
      end
    end
  end
  
end

return EnemySpawner


