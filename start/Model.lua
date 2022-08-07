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
    enemies
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
    bullets,
    ship
}

Model.playerHealthManagerParams = {
  assetName = "health",
  health = 3,
}

Model.playerLivesManagerParams = {
  lives = 3,
}

Model.collisionManagerParams = {
    enemies,
    ship
}

Model.enemyPatrolShootEasyParams = {
    speed = 100,
    fireRate = 3,
    moveSide = true,
    rngDirSides = 99999999,
    moveDown = true,
    rngDirDown = 99999999,
    weaponType = "normal",
    bulletSpeed = 200
}


Model.enemyParams = {
    assetName = "enemy",
    enemyBullets
}

Model.enemySpawnerParams = {
   enemies
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
    
    --define enemies here
    Model.enemyParams.asset = AssetsManager.sprites[Model.enemyParams.assetName]
    Model.enemyBulletParams.asset = AssetsManager.sprites[Model.enemyBulletParams.assetName]
end


return Model