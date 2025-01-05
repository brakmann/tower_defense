local system = {}

system.OnUpdate = function(_entity)
  _entity.screenPosition.x = _entity.cardPosition * 100 + 100
end 
system.filters = {"cardPosition", "screenPosition"}

return system