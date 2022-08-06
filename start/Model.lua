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

Model.bulletsParams = {
    assetName = "bullet",
    speed = 500,
}

Model.weaponFireManagerParams = {
    fireRate = 0.5,
    bullets,
    ship
}


Model.init = function()
    Model.stage = {
        stageHeight = love.graphics.getHeight(),
        stageWidth = love.graphics.getWidth()
    }
    
    
    --init assets dynamically
    Model.shipParams.asset = AssetsManager.sprites[Model.shipParams.assetName]
    Model.bulletsParams.asset = AssetsManager.sprites[Model.bulletsParams.assetName]
    
    --define enemies here

end


return Model