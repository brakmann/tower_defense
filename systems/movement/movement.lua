local system = {}

system.OnUpdate = function(_entity)
    if _entity.screenPosition.x < _entity.targetPosition.x then
        _entity.screenPosition.x = _entity.screenPosition.x + _entity.speed
    elseif _entity.screenPosition.x > _entity.targetPosition.x  then 
        _entity.screenPosition.x = _entity.screenPosition.x - _entity.speed
    end

    if _entity.screenPosition.y < _entity.targetPosition.y then
        _entity.screenPosition.y = _entity.screenPosition.y + _entity.speed
    elseif _entity.screenPosition.y > _entity.targetPosition.y  then 
        _entity.screenPosition.y = _entity.screenPosition.y - _entity.speed
    end
end

system.filters = {"targetPosition"}

return system