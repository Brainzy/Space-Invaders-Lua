local classes = require("classes")
local NotificationManager = classes.class()
local Model = require("Model")

local lostGame = false
local wonGame = false
local notificationText = ""
local timer = 1
local notificationEnd = 0
local printNotification = false
local waveClearTextDuration = 0

function NotificationManager:init(params)
    waveClearTextDuration = params.waveClearTextDuration
    self.x = Model.stage.stageWidth/2
    self.y = Model.stage.stageHeight/2
end

function PlayerLostGame()
  lostGame = true
end

function PlayerWonGame()
  wonGame = true
end

function NotificationManager:WaveClearNotification(waveNumber)
    notificationText= "Wave " .. waveNumber .. " cleared!"
    notificationEnd = timer + waveClearTextDuration
end

function NotificationManager:update(dt)
  timer = timer +dt
  
  if ( timer < notificationEnd ) then
    printNotification = true
  else
    printNotification = false
  end
  
end

function NotificationManager:draw()
  
  if (lostGame) then
    love.graphics.print("YOU LOST", self.x -30, self.y)
  end
  
  if (wonGame) then
    love.graphics.print("YOU WON", self.x -30, self.y)
  end
  
  if (printNotification and wonGame == false) then
    love.graphics.print(notificationText, self.x -30, self.y)
  end
  
end

return NotificationManager