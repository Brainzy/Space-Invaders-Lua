local AssetsManager = require("AssetsManager")
local Model = {
    movement = {
        up = false,
        down = false,
        left = false,
        right = false,
        space = false
    }
}

Model.shipParams = {
    assetName = "ship",
    speed = 400,
}

Model.starsParams = {
    radius = 1,
    speed = 100,
    numStars = 200
}

Model.playerBulletParams = {
    assetName = "bullet",
    enemies,
    xSpeed = 125
}

Model.enemyBulletParams = {
    assetName = "bullet",
    ship
}

Model.normalPlayerBullet = {
    speed = 500,
}

Model.weaponFireManagerParams = {
    fireRate = 0.5,
    powerUpFireRate = 0.2,
    bullets,
    ship
}

Model.playerHealthManagerParams = {
  assetName = "health",
  health = 3,
}

Model.notificationManagerParams = {
  waveClearTextDuration = 2
}

Model.playerLivesManagerParams = {
  lives = 3,
}

Model.collisionManagerParams = {
    enemies,
    ship,
    coinSpawner,
    healthPackSpawner
}

Model.scoreDisplayManagerParams = {
  scoreForCoin = 2,
  scoreForEnemy = 5,
  scoreForLostLife = -50
}

Model.timedPowerUpSpawnerParams = {
  fireAnglesName = "fireAngles",
  fireRateName= "fireRate",
  magnetName= "magnet",
  shieldName= "shield",
  rngOnEnemyDeath = 5,
  altAnglesChance = 25, -- 0-100, must be total 100 for all power ups
  greaterFireChance= 25,
  shieldChance = 25,
  magnetChance = 25, 
  altAngleDuration = 4,
  shieldDuration = 4,
  magnetDuration = 4,
  powerUpFireRateDuration = 4,
}

Model.healthPackSpawnerParams = {
  assetName = "health",
  rng = 1, -- every second rolls 0,100
  expiresAfter = 3
}

Model.enemyParams = {
  assetName = "enemy",
  enemyBullets,
  explosionManager
}

Model.enemySpawnerParams = {
  enemies,
  notificationManager,
  waveParams
}

Model.coinSpawnerParams = {
  assetName = "coin",
  rng = 20, -- every second rolls 0,100
  expiresAfter = 3
}

Model.powerFireAnglesParams = {
  duration = 8
}

Model.powerFireRateParams = {
  duration = 8
}

Model.powerMagnetParams = {
  assetName = "magnet",
  duration = 20,
  maxDistance = 40000,
  coinDrawInSpeed = 400,
  coinSpawner,
  ship
}

Model.powerShieldsParams = {
  assetName = "shield",
  duration = 6,
  shieldAmount = 15,
  ship
}

Model.explosionManagerParams = {
  assetName = "explosion",
  explosionDuration = 0.3
}

Model.enemyPatrolShootEasyParams = {
    speed = 100,
    fireRate = 3,
    moveSide = true,
    rngDirSides = 99999999,
    moveDown = false,
    rngDirDown = 99999999,
    weaponType = "normal",
    bulletSpeed = 200
}

Model.enemyKamikazeEasy = {
    speed = 300,
    fireRate = 9999999,
    moveSide = true,
    rngDirSides = 99999999,
    moveDown = true,
    rngDirDown = 600,
    weaponType = "normal",
    bulletSpeed = 200
}

Model.init = function()
    Model.stage = {
        stageHeight = love.graphics.getHeight(),
        stageWidth = love.graphics.getWidth()
    }
    
    --init assets dynamically
    Model.shipParams.asset = AssetsManager.sprites[Model.shipParams.assetName]
    Model.playerBulletParams.asset = AssetsManager.sprites[Model.playerBulletParams.assetName]
    Model.playerHealthManagerParams.asset = AssetsManager.sprites[Model.playerHealthManagerParams.assetName]
    Model.explosionManagerParams.asset = AssetsManager.sprites[Model.explosionManagerParams.assetName]
    Model.coinSpawnerParams.asset = AssetsManager.sprites[Model.coinSpawnerParams.assetName]
    Model.healthPackSpawnerParams.asset = AssetsManager.sprites[Model.healthPackSpawnerParams.assetName]
    Model.timedPowerUpSpawnerParams.fireAnglesAsset = AssetsManager.sprites[Model.timedPowerUpSpawnerParams.fireAnglesName]
    Model.timedPowerUpSpawnerParams.magnetAsset = AssetsManager.sprites[Model.timedPowerUpSpawnerParams.magnetName]
    Model.timedPowerUpSpawnerParams.fireRateAsset = AssetsManager.sprites[Model.timedPowerUpSpawnerParams.fireRateName]
    Model.timedPowerUpSpawnerParams.shieldAsset = AssetsManager.sprites[Model.timedPowerUpSpawnerParams.shieldName]
    Model.powerShieldsParams.asset = AssetsManager.sprites[Model.powerShieldsParams.assetName]
    Model.powerMagnetParams.asset = AssetsManager.sprites[Model.powerMagnetParams.assetName]
    
    --define enemies here
    Model.enemyParams.asset = AssetsManager.sprites[Model.enemyParams.assetName]
    Model.enemyBulletParams.asset = AssetsManager.sprites[Model.enemyBulletParams.assetName]
end


return Model