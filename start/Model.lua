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

Model.bulletAsset = {
    assetName = "bullet",
}

Model.normalPlayerBullet = {
    speed = 500,
}

Model.weaponFireManagerParams = {
    fireRate = 0.5,
    bullets,
    ship
}

Model.enemyPatrolShootEasyParams = {
    assetName = "enemy",
    speed = 200,
    fireRate = 3,
    movesLeftToRight = true,
    movesDown = false,
    weaponType = "normal"
}


Model.init = function()
    Model.stage = {
        stageHeight = love.graphics.getHeight(),
        stageWidth = love.graphics.getWidth()
    }
    
    
    --init assets dynamically
    Model.shipParams.asset = AssetsManager.sprites[Model.shipParams.assetName]
    Model.bulletAsset.asset = AssetsManager.sprites[Model.bulletAsset.assetName]
    
    --define enemies here
    Model.enemyPatrolShootEasyParams.asset = AssetsManager.sprites[Model.enemyPatrolShootEasyParams.assetName]

end


return Model