--EXAMPLES
----------------------
--for debugging in zero brane
require("mobdebug").start()

--this is to make prints appear right away in zerobrane
io.stdout:setvbuf("no")

----EXAMPLES: INSTANTIARING A CLASS

local ShipCls = require("Ship")
local ship = nil

local StarsCls = require("Stars")
local stars = nil

local BulletsCls = require("Bullets")
local bullets = nil

local AssetsManager = require("AssetsManager")
local Model = require("Model")

local WeaponFireManagerCls = require("WeaponFireManager")
local weaponFireManager= nil

local EnemySpawnerCls = require("EnemySpawner")
local enemySpawner = nil

local EnemiesCls = require("Enemies")
local enemies = nil

local CollisionManagerCls = require("CollisionManager")
local collisionManager = nil

local EnemyBuleltsCls = require("EnemyBullets")
local enemyBullets = nil

local PlayerHealthManagerCls = require("PlayerHealthManager")
local playerHealthManager = nil

local PlayerLivesManagerCls = require("PlayerLivesManager")
local playerLivesManager = nil

local WaveParamsCls = require("WaveParams")
local waveParams = nil

local NotificationManagerCls = require("NotificationManager")
local notificationManager = nil

local ExplosionManagerCls = require("ExplosionManager")
local explosionManager = nil

local CoinSpawnerCls = require("CoinSpawner")
local coinSpawner = nil

local ScoreDisplayManagerCls = require("ScoreDisplayManager")
local scoreDisplayManager = nil

local HealthPackSpawnerCls = require("HealthPackSpawner")
local healthPackSpawner = nil

local TimedPowerUpSpawnerCls = require("TimedPowerUpSpawner")
local timedPowerUpSpawner = nil

local LEFT_KEY = "left"
local RIGHT_KEY = "right"
local UP_KEY = "up"
local DOWN_KEY = "down"
local SPACE_KEY = "space"
local ESC_KEY = "escape"

local pauseGame=false

function love.load()
    print("love.load")
    AssetsManager.init()
    Model.init()
    stars = StarsCls.new( Model.starsParams)
    ship = ShipCls.new( Model.shipParams )  
    
    notificationManager = NotificationManagerCls.new (Model.notificationManagerParams)
    
    timedPowerUpSpawner = TimedPowerUpSpawnerCls.new ( Model.timedPowerUpSpawnerParams )
    
    coinSpawner = CoinSpawnerCls.new(Model.coinSpawnerParams)
    
    Model.explosionManagerParams.ship = ship
    explosionManager = ExplosionManagerCls.new(Model.explosionManagerParams)
    
    Model.enemyBulletParams.ship = ship
    enemyBullets = EnemyBuleltsCls.new ( Model.enemyBulletParams )
    
    Model.enemyParams.enemyBullets = enemyBullets
    Model.enemyParams.explosionManager = explosionManager
    enemies = EnemiesCls.new( Model.enemyParams )
    
    waveParams = WaveParamsCls.new ()
    
    Model.enemySpawnerParams.enemies = enemies
    Model.enemySpawnerParams.notificationManager = notificationManager
    Model.enemySpawnerParams.waveParams = waveParams
    enemySpawner = EnemySpawnerCls.new( Model.enemySpawnerParams )
    
    Model.playerBulletParams.enemies = enemies
    bullets= BulletsCls.new ( Model.playerBulletParams )
    
    Model.weaponFireManagerParams.bullets = bullets
    Model.weaponFireManagerParams.ship = ship
    weaponFireManager = WeaponFireManagerCls.new ( Model.weaponFireManagerParams )
    
    healthPackSpawner = HealthPackSpawnerCls.new ( Model.healthPackSpawnerParams )
    
    Model.collisionManagerParams.enemies = enemies
    Model.collisionManagerParams.ship = ship
    Model.collisionManagerParams.coinSpawner = coinSpawner
    Model.collisionManagerParams.healthPackSpawner = healthPackSpawner
    collisionManager = CollisionManagerCls.new ( Model.collisionManagerParams  )
    
    playerHealthManager = PlayerHealthManagerCls.new ( Model.playerHealthManagerParams )
    
    Model.playerLivesManagerParams.ship = ship
    playerLivesManager = PlayerLivesManagerCls.new ( Model.playerLivesManagerParams )
    
    scoreDisplayManager = ScoreDisplayManagerCls.new ( Model.scoreDisplayManagerParams )
    
end

function love.update(dt)
   -- print("update")
  if (pauseGame == false) then
    ship:update(dt)
    stars:update(dt)
    bullets: update(dt)
    weaponFireManager: update(dt)
    enemies: update(dt)
    enemySpawner: update(dt)
    enemyBullets: update(dt)
    notificationManager:update(dt)
    explosionManager: update(dt)
    coinSpawner:update(dt)
    healthPackSpawner:update(dt)
    timedPowerUpSpawner:update(dt)
  end
end


function love.draw()
    --love.graphics.draw(AssetsManager.sprites.fireAngles, 0,0 )
    stars:draw()
    ship:draw()
    bullets:draw()   
    enemies:draw()
    enemyBullets:draw()
    playerHealthManager:draw()
    playerLivesManager:draw()
    notificationManager:draw()
    explosionManager:draw()
    coinSpawner.draw()
    scoreDisplayManager.draw()
    healthPackSpawner.draw()
    timedPowerUpSpawner.draw()
    --love.graphics.print("You Win!", 180, 350)
end


function love.keypressed(key)
    if key == LEFT_KEY then
        Model.movement.left = true
    elseif key == RIGHT_KEY then
        Model.movement.right = true
    end
    
    if key == UP_KEY then
        Model.movement.up = true
    elseif key == DOWN_KEY then
        Model.movement.down = true
    end
    
    if key == SPACE_KEY then
      Model.movement.space = true;
    end

    if key == ESC_KEY then
      pauseGame = not pauseGame
    end
end

function love.keyreleased(key)
    if key == LEFT_KEY then
        Model.movement.left = false
    elseif key == RIGHT_KEY then
        Model.movement.right = false
    end
    
    if key == UP_KEY then
        Model.movement.up = false
    elseif key == DOWN_KEY then
        Model.movement.down = false
    end
    
    if key == SPACE_KEY then
      Model.movement.space = false;
    end
   
end

function Clamp(min, val, max)
    return math.max(min, math.min(val, max));
end


function PauseGame()
  pauseGame = true
end
--
--



