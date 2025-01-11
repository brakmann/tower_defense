local system = {}

system.OnUpdate = function(_entity)
    if _entity.HP <= 0 then
        _entity.toDestroyTag = true
    end
end 
system.filters = {"HP"}

return system