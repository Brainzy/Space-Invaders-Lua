local classes = require("classes")
local EnemySpawner = classes.class()
local Model = require("Model")
local spawnTimer= 0;

function EnemySpawner:init(params)
    self.enemies = params.enemies
    spawnTimer = 2
end

function EnemySpawner:update(dt)

spawnTimer = spawnTimer - dt

  if (spawnTimer < 0) then
     self.enemies:SpawnEnemy(Model.enemyPatrolShootEasyParams)
     spawnTimer = 1
  end
    
    
end

return EnemySpawner


