local becs = require 'engine.becs'

local system = {}

system.OnUpdate = function(_entity)
    if _entity.resourceCollectorCooldown <= 0 then
        _entity.resourceCollectorCooldown = _entity.resourceCollectorFrequency
        local storage = becs.getFirstEntity({"resourceStorageTag"})
        if storage then 
            storage.magicAmount = storage.magicAmount + 1
            print(storage.magicAmount)
        end   
    else 
        _entity.resourceCollectorCooldown = _entity.resourceCollectorCooldown - love.timer.getDelta()
    end 
end

system.filters = {"resourceCollectorFrequency", "resourceCollectorCooldown"}

return system