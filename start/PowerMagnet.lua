local classes = require("classes")
local PowerMagnet = classes.class()
local Model = require("Model")
local duration
local timer =0
local isActive = false
local coinSpawner
local maxDistance
local ship
local coinDrawInSpeed
local asset

function PowerMagnet:init(params)
  duration = params.duration
  coinSpawner = params.coinSpawner
  maxDistance = params.maxDistance
  ship = params.ship
  coinDrawInSpeed = params.coinDrawInSpeed
  asset = params.asset
  isActive = true
end

function PowerMagnetActivated()
  isActive = true
  timer = duration
end

function PowerMagnet:update(dt)
  
  if (isActive) then    -- if coin is close move towards ship
    timer = timer -dt
    local coins = coinSpawner:ReturnCoins()
    ship.x, ship.y = ship:ReturnPosition() 
    for i=1, #coins do
      local coin = coins[i]
      if (squareDistance (coin.x, coin.y, ship.x, ship.y) < maxDistance) then
        angle = math.atan2(coin.y - ship.y, coin.x - ship.x)
        coin.x = coin.x - math.cos(angle) * dt * coinDrawInSpeed
        coin.y = coin.y - math.sin(angle) * dt * coinDrawInSpeed
      end  
    end
    
    if(timer <= 0) then
      isActive = false
    end
  end
end

function squareDistance ( x1, y1, x2, y2 )
  local dx = x1 - x2
  local dy = y1 - y2
  --print("vracam distancu ", ( dx * dx + dy * dy ), maxDistance)
  return ( dx * dx + dy * dy )
end

function PowerMagnet:draw()
    ship.x, ship.y = ship:ReturnPosition() 
    if (isActive) then
      love.graphics.draw(asset, ship.x -9 ,ship.y - 5, 0, 0.5, 0.5 )
    end    
end
return PowerMagnet