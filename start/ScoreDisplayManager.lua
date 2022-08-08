local classes = require("classes")
local ScoreDisplayManager = classes.class()
local Model = require("Model")
local scoreForCoin
local scoreForEnemy
local scoreForLostLife
local currentScore = 0
local printX
local printY

function ScoreDisplayManager:init(params)
    scoreForCoin = params.scoreForCoin
    scoreForEnemy = params.scoreForEnemy
    scoreForLostLife = params.scoreForLostLife
    printX = Model.stage.stageWidth /2 -10
    printY = 0
end

function PlayerCollectedCoinScoreEnter()
  currentScore = currentScore + scoreForCoin
end 
 
function PlayerKilledEnemyScoreEnter()
  currentScore = currentScore + scoreForEnemy
end 

function PlayerLostLifeScoreEnter()
  currentScore = currentScore + scoreForLostLife
end 

function ScoreDisplayManager:draw()
  love.graphics.print(currentScore, printX, printY)
end

return ScoreDisplayManager