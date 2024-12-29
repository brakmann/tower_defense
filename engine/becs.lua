local becs = {}
local tools = require 'engine.tools'


becs.initializeWorld = function()
    becs.systemsWorld = {}
    becs.entitiesWorld = {}
end 

becs.addSystemToWorld = function(_system)
    table.insert(becs.systemsWorld, _system)
end

--if create entity from prefab, should make deepcopy of prefab, then change parameters, then call AddEntityToWorld
becs.addEntityToWorld = function(_entity)
    local entity = _entity
    entity.id = #becs.entitiesWorld + 1
    table.insert(becs.entitiesWorld, entity)
end

--function that takes function type (onInit, onUpdate, etc)
--and in loop do all functions with that type from all systems with all entities with needed tag
becs.callSystems = function(_functionName)
    for keySystem, valueSystem in pairs(becs.systemsWorld) do
        for keyEntity, valueEntity in pairs(becs.entitiesWorld) do
            if becs.filterAll(valueEntity, valueSystem.filters) and valueSystem[_functionName] then
                valueSystem[_functionName](valueEntity)
            end
        end
    end
end

becs.destroyEntitesByFilter = function(_filters)
    local entities = becs.getEntities(_filters)
    for i = 1, #entities do 
        entities[i].toDestroyTag = true
    end
end

--function that takes filters and returns all entities from the world that fits the filters
--system call it to implement their own logic, but shouldn't modify this enities
becs.getEntities = function(_filters)
    local entities = {}
    for keyEntity, valueEntity in pairs(becs.entitiesWorld) do
        if becs.filterAll(valueEntity, _filters) then
            table.insert(entities, valueEntity)
        end
    end 

    if next(entities) == nil then
        return nil
    end
    return entities
     
end

becs.filterAll = function(_entity, _filters)
    local isOkPair = true            
    --checking if all filters are components of entity
    for keyFilter, valueFilter in pairs(_filters) do
        if not _entity[valueFilter] then
            isOkPair = false
        end
    end
    return isOkPair
end

--draw everything that has sprite and screenPosition components. 
--Could be in CallSystems, this is hardcode for sprites to separate engine from system implementation
becs.renderSprites = function()
    for keyEntity, valueEntity in pairs(becs.entitiesWorld) do
        if valueEntity.sprite and valueEntity.screenPosition then
            love.graphics.draw(valueEntity.sprite, valueEntity.screenPosition.x, valueEntity.screenPosition.y)
        end
    end
end

--find entities that has coolider that located at x, y and add clickedTag component
--there should be a system that implements OnClick with filter = clickedTag
--Could be in CallSystems, this is hardcode for clicks to separate engine from system implementation
becs.addClickedTags = function(_x, _y)
    for keyEntity, valueEntity in pairs(becs.entitiesWorld) do
        if  valueEntity.screenPosition and valueEntity.collider and
            _x >= valueEntity.screenPosition.x and 
            _x < valueEntity.screenPosition.x + valueEntity.collider.w and 
            _y >= valueEntity.screenPosition.y and 
            _y < valueEntity.screenPosition.y + valueEntity.collider.h then
                valueEntity.clickedTag = true
        end
    end
end

--remove all clicked tags. Call after AddClickedTags
becs.removeClickedTags = function()
    for keyEntity, valueEntity in pairs(becs.entitiesWorld) do
        if valueEntity.clickedTag then
            valueEntity.clickedTag = nil
        end
    end
end

--destroy everything that has toDestroyTag component
--Could be in CallSystems, this is hardcode for unused objects to separate engine from system implementation
becs.destroy = function()
    for i=#becs.entitiesWorld, 1, -1 do
        if becs.entitiesWorld[i].toDestroyTag then
            table.remove(becs.entitiesWorld, i)
        end
    end 
end

return becs