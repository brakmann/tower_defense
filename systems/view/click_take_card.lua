local tools = require 'engine.tools'
local becs = require 'engine.becs'

local system = {}

system.OnClick = function(_card)
    local cards = becs.getEntities({"clickableHandCard"})
    if cards then 
        amountOfCards = #cards
    else
        amountOfCards = 0
    end
    local card = tools.deepcopy(require('prefabs.card'))
    card.cardPosition = amountOfCards + 1
    becs.addEntityToWorld(card)
end 

system.filters = {"clickedTag", "takeCardButtonTag", "screenPosition", "collider"}

return system