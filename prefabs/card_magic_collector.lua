local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/card_yellow.png", {mipmaps = true})
entity.collider = {w = 203, h = 303}
entity.isSelected = false
entity.inHandCard = false
entity.inDeckCard = true
entity.cardPosition = {x = 0, y = 0}
entity.buildingPrefab = 'prefabs.tower_magic_collector'

return entity