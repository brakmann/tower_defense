local becs = require 'engine.becs'
local tools = require 'engine.tools'

local system = {}

system.OnClick = function(_tile)
    local selectedCard = becs.getFirstEntity({"clickableHandCard", "isSelected"})
    if selectedCard then
        _tile.isFree = false
        local building = tools.deepcopy(require(selectedCard.buildingPrefab))
        becs.addEntityToWorld(building)
        selectedCard.toDestroyTag = true
    else 
        print('card isnt selected')
    end
end 

system.filters = {"clickedTag", "tileTag", "isFree", "screenPosition", "collider"}

return system