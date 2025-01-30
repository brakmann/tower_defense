local system = {}

system.OnUpdate = function(_card)
  _card.screenPosition = {x = _card.cardPosition.x * 100 + 100, y = _card.cardPosition.y * 50 + 400}
end 
system.filters = {"cardPosition", "inHandCard"}

return system