local becs = require 'engine.becs'
local tools = require 'engine.tools'

local system = {}

system.OnClick = function(_tile)
    local selectedCard = becs.getFirstEntity({"clickableHandCard", "isSelected"})
    if selectedCard then
        local building = tools.deepcopy(require(selectedCard.buildingPrefab))
        local storage = becs.getFirstEntity({"resourceStorageTag"})
        if storage.magicAmount >= building.cost.magic and storage.techAmount >= building.cost.tech and storage.alchAmount >= building.cost.alch then 
            storage.magicAmount = storage.magicAmount - building.cost.magic
            storage.techAmount = storage.techAmount - building.cost.tech
            storage.alchAmount = storage.alchAmount - building.cost.alch
            _tile.isFree = false
            building.screenPosition = _tile.screenPosition
            becs.addEntityToWorld(building)
            selectedCard.toDestroyTag = true
        end
    end
end 

system.filters = {"clickedTag", "tileTag", "isFree", "screenPosition", "collider"}

return system