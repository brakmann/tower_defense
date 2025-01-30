local system = {}

system.OnUpdate = function(_entity)
  --тут кэфы зависят от размера спрайта и от скейла
  _entity.screenPosition = {x = _entity.tilePosition.x * 105, y = _entity.tilePosition.y * 105}
end 
system.filters = {"tilePosition"}

return system