local becs = require 'engine.becs'
local tools = require 'engine.tools'


local system = {}

system.OnUpdate = function(_entity)
    if _entity.attackCooldown <= 0 then
        _entity.attackCooldown = _entity.attackFrequency
        local projectile = tools.deepcopy(require('prefabs.projectile'))
        projectile.screenPosition.x = _entity.screenPosition.x
        projectile.screenPosition.y = _entity.screenPosition.y
        projectile.targetPosition.x = 1000
        projectile.targetPosition.y = 1000
        becs.addEntityToWorld(projectile)
        print('shot')
    else 
        _entity.attackCooldown = _entity.attackCooldown - love.timer.getDelta()
    end 
end

system.filters = {"attackFrequency", "attackCooldown"}

return system