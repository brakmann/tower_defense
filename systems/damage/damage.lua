local becs = require 'engine.becs'

local system = {}

system.OnUpdate = function(_entity)
    --if enough distance
    if _entity.damageCooldown <= 0 then
        _entity.damageCooldown = _entity.damageFrequency
        local target = becs.getEntityById(_entity.targetId)
        if target then 
            if _entity.screenPosition.x > target.screenPosition.x - 5 and _entity.screenPosition.x < target.screenPosition.x + 5 and _entity.screenPosition.y > target.screenPosition.y - 5 and _entity.screenPosition.y < target.screenPosition.y then
                target.HP = target.HP - 1
                print (target.HP)
            end   
        end
    else 
        _entity.damageCooldown = _entity.damageCooldown - love.timer.getDelta()
    end 
end 
system.filters = {"damage", "damageFrequency", "damageCooldown"}

return system