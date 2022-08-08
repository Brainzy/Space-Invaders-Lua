local classes = require("classes")
local WeaponFireManager = classes.class()
local Model = require("Model")
local fireTimer = 0
local currentWeapon = "normal"
local currentFireRate = 0
local normalFireRate = 0
local powerUpFireRate = 0

function WeaponFireManager:init(params)
    normalFireRate = params.fireRate
    self.bullets= params.bullets
    self.ship= params.ship
    powerUpFireRate = params.powerUpFireRate
    currentFireRate = normalFireRate
    fireTimer = currentFireRate
end

function ChangeWeapon(weaponType)
    currentWeapon = weaponType
    if (currentWeapon == "tripleStraight") then
      currentFireRate = powerUpFireRate
    else
      currentFireRate = normalFireRate
    end
end

function WeaponFireManager:update(dt)
  fireTimer = fireTimer - dt
    if Model.movement.space then
      if (fireTimer < 0) then
        self.bullets:SpawnNewBullet(Model.normalPlayerBullet.speed, currentWeapon, self.ship:ReturnBulletSpawnPosition())
        fireTimer = currentFireRate;
      end
    end
end

return WeaponFireManager