local classes = require("classes")
local WaveParams = classes.class()
local Model = require("Model")

local allLevels = {}

--Model.enemyPatrolShootEasyParams = {
--Model.enemyPatrolShootNormalParams = {
--Model.enemyPatrolShootHardParams = {
--Model.enemyKamikazeEasy = {
--Model.enemyKamikazeNormal = {
--Model.enemyKamikazeEasy = {
--Model.enemyKamikazeNormal = {
--Model.enemyKamikazeHard = {
--Model.enemyKamikazeEasyShooter = {
--Model.enemyKamikazeNormalShooter = {
--Model.enemyKamikazeHardShooter = {
--Model.enemySlowMoveShooterEasy = {
--Model.enemySlowMoveShooterNormal = {
--Model.enemySlowMoveShooterHard = {


local spawn = {level = 1, start = 0, endTime = 15, interval = 5 , enemy = Model.enemyPatrolShootEasyParams}
table.insert(allLevels, spawn)

spawn = {level = 1, start = 10, endTime = 20, interval = 3 , enemy = Model.enemyKamikazeEasy}
table.insert(allLevels, spawn)

spawn = {level = 2, start = 0, endTime = 20, interval = 4 , enemy = Model.enemyPatrolShootEasyParams}
table.insert(allLevels, spawn)

spawn = {level = 2, start = 20, endTime = 30, interval = 3 , enemy = Model.enemyPatrolShootEasyParams}
table.insert(allLevels, spawn)

spawn = {level = 2, start = 20, endTime = 30, interval = 3 , enemy = Model.enemyKamikazeEasy}
table.insert(allLevels, spawn)

spawn = {level = 3, start = 0, endTime = 18, interval = 5 , enemy = Model.enemyKamikazeEasy}
table.insert(allLevels, spawn)

spawn = {level = 3, start = 0, endTime = 18, interval = 5 , enemy = Model.enemySlowMoveShooterEasy}
table.insert(allLevels, spawn)

spawn = {level = 3, start = 0, endTime = 18, interval = 10 , enemy = Model.enemyKamikazeEasyShooter}
table.insert(allLevels, spawn)

spawn = {level = 3, start = 18, endTime = 30, interval = 3 , enemy = Model.enemyKamikazeEasy}
table.insert(allLevels, spawn)

spawn = {level = 3, start = 18, endTime = 30, interval = 3 , enemy = Model.enemySlowMoveShooterEasy}
table.insert(allLevels, spawn)

spawn = {level = 3, start = 18, endTime = 30, interval = 7 , enemy = Model.enemyKamikazeEasyShooter}
table.insert(allLevels, spawn)

spawn = {level = 4, start = 0, endTime = 40, interval = 3 , enemy = Model.enemySlowMoveShooterNormal}
table.insert(allLevels, spawn)

spawn = {level = 4, start = 0, endTime = 40, interval = 3 , enemy = Model.enemyKamikazeNormalShooter}
table.insert(allLevels, spawn)

spawn = {level = 5, start = 0, endTime = 50, interval = 3 , enemy = Model.enemySlowMoveShooterHard}
table.insert(allLevels, spawn)

spawn = {level = 5, start = 0, endTime = 50, interval = 3 , enemy = Model.enemyKamikazeHardShooter}
table.insert(allLevels, spawn)

spawn = {level = 6, start = 0, endTime = 60, interval = 4 , enemy = Model.enemySlowMoveShooterHard}
table.insert(allLevels, spawn)

spawn = {level = 6, start = 0, endTime = 60, interval = 4 , enemy = Model.enemyKamikazeHardShooter}
table.insert(allLevels, spawn)

spawn = {level = 6, start = 0, endTime = 60, interval = 4 , enemy = Model.enemyPatrolShootHardParams}
table.insert(allLevels, spawn)



function WaveParams: GetAllLevels()
  return allLevels;
end

return WaveParams