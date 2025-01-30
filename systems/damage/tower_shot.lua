local becs = require 'engine.becs'
local tools = require 'engine.tools'
local game = require 'engine.game'

local system = {}

system.OnUpdate = function(_entity)
    if _entity.attackCooldown <= 0 then
        local enemies = becs.getEntities({"enemyTag"})
        if enemies then
            nearestEnemy = game.findNearest(_entity, enemies)
            _entity.attackCooldown = _entity.attackFrequency
            local projectile = tools.deepcopy(require(_entity.projectilePrefab))
            projectile.screenPosition.x = _entity.screenPosition.x
            projectile.screenPosition.y = _entity.screenPosition.y
            if nearestEnemy then
                projectile.targetPosition.x = nearestEnemy.screenPosition.x
                projectile.targetPosition.y = nearestEnemy.screenPosition.y
            end
            becs.addEntityToWorld(projectile)
        end
    else 
        _entity.attackCooldown = _entity.attackCooldown - love.timer.getDelta()
    end 
end

system.filters = {"towerTag", "attackFrequency", "attackCooldown"}

return system