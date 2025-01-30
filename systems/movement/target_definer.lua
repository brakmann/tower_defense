local becs = require 'engine.becs'

local system = {}

system.OnUpdate = function(_entity)
    local towers = becs.getEntities({"towerTag"})
    if towers then
        local minDistance = 9007199254740991
        local minDistanceIndex = 0
        for i=1, #towers do
            local distance = math.sqrt((towers[i].screenPosition.x - _entity.screenPosition.x)^2 + (towers[i].screenPosition.y - _entity.screenPosition.y)^2)
            if distance < minDistance then
                minDistance = distance
                minDistanceIndex = i
            end
        end
        _entity.targetId = towers[minDistanceIndex].id
        _entity.targetPosition.x = towers[minDistanceIndex].screenPosition.x
        _entity.targetPosition.y = towers[minDistanceIndex].screenPosition.y
    end
end 
system.filters = {"targetPosition", "screenPosition", "enemyTag"}

return system