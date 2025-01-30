local becs = require 'engine.becs'
local game = require 'engine.game'

local system = {}

system.OnUpdate = function(_entity)
    local towers = becs.getEntities({"towerTag"})
    if towers then
        nearestTower = game.findNearest(_entity, towers)
        _entity.targetId = nearestTower.id
        _entity.targetPosition.x = nearestTower.screenPosition.x
        _entity.targetPosition.y = nearestTower.screenPosition.y
    end
end 
system.filters = {"targetPosition", "screenPosition", "enemyTag"}

return system