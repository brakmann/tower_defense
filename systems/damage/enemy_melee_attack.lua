local becs = require 'engine.becs'

local system = {}

system.OnUpdate = function(_entity)
    --if enough distance
    if _entity.attackCooldown <= 0 then
        _entity.attackCooldown = _entity.attackFrequency
        local target = becs.getEntityById(_entity.targetId)
        if target then 
            if _entity.screenPosition.x > target.screenPosition.x - 5 and _entity.screenPosition.x < target.screenPosition.x + 5 and _entity.screenPosition.y > target.screenPosition.y - 5 and _entity.screenPosition.y < target.screenPosition.y then
                target.HP = target.HP - _entity.damage
            end   
        end
    else 
        _entity.attackCooldown = _entity.attackCooldown - love.timer.getDelta()
    end 
end 
system.filters = {"enemyTag", "damage", "attackFrequency", "attackCooldown"}

return system