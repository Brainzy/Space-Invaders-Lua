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

local LEFT_KEY = "left"
local RIGHT_KEY = "right"
local UP_KEY = "up"
local DOWN_KEY = "down"
local SPACE_KEY = "space"


function love.load()
    print("love.load")
    AssetsManager.init()
    Model.init()
    stars = StarsCls.new( Model.starsParams)
    bullets= BulletsCls.new ( Model.bulletsParams )
    ship = ShipCls.new( Model.shipParams)
    Model.weaponFireManagerParams.bullets = bullets
    Model.weaponFireManagerParams.ship = ship
    weaponFireManager = WeaponFireManagerCls.new ( Model.weaponFireManagerParams )
end

function love.update(dt)
   -- print("update")
    ship:update(dt)
    stars:update(dt)
    bullets: update(dt)
    weaponFireManager: update(dt)
end


function love.draw()
    --love.graphics.draw(AssetsManager.sprites.fireAngles, 0,0 )
    stars:draw()
    ship:draw()
    bullets:draw()    
    --love.graphics.print("You Win!", 180, 350)
end


function love.keypressed(key)
    print(key)
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
--
--



