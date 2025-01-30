local tools = require 'engine.tools'
local becs = require 'engine.becs'

local system = {}

--take from deck
system.OnClick = function(_button)
    local inDeckCards = becs.getEntities({"inDeckCard"})
    if inDeckCards then
        local card = inDeckCards[1]
        local inHandCards = becs.getEntities({"inHandCard"})
        if inHandCards then
            card.cardPosition.x = #inHandCards + 1
            print("tuned")
        else
            card.cardPosition.x = 1
        end
        card.inDeckCard = false
        card.inHandCard = true
    end    
end 

system.filters = {"clickedTag", "takeCardButtonTag", "screenPosition", "collider"}

return system