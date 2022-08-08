local classes = require("classes")
local WeaponFireManager = classes.class()
local Model = require("Model")
local fireTimer = 0

function WeaponFireManager:init(params)
    self.fireRate = params.fireRate
    self.bullets= params.bullets
    self.ship= params.ship
end

function WeaponFireManager:update(dt)
  fireTimer = fireTimer - dt
    if Model.movement.space then
      if (fireTimer < 0) then       
        self.bullets:SpawnNewBullet(Model.normalPlayerBullet.speed,"tripleStraight", self.ship:ReturnBulletSpawnPosition())
        fireTimer = self.fireRate;
      end
    end
end

return WeaponFireManager