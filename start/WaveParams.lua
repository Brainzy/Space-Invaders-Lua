local classes = require("classes")
local WaveParams = classes.class()
local Model = require("Model")

local allLevels = {}

local spawn1 = {level = 1, start = 0, endTime = 15, interval = 5 , enemy = Model.enemyPatrolShootEasyParams}
local spawn2 = {level = 1, start = 10, endTime = 20, interval = 5 , enemy = Model.enemyKamikazeEasy}
local spawn3 = {level = 2, start= 0, endTime = 10, interval = 2 , enemy = Model.enemyKamikazeEasy}

table.insert(allLevels, spawn1)
table.insert(allLevels, spawn2)
table.insert(allLevels, spawn3)


function WaveParams: GetAllLevels()
  return allLevels;
end

return WaveParams