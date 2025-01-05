local system = {}

system.OnUpdate = function(_entity)
    _entity.targetPosition = {x = 0, y = 0}
end 
system.filters = {"targetPosition"}

return system