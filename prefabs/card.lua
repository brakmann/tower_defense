local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/card_yellow.png", {mipmaps = true})
entity.screenPosition = {x = 0, y = 400}
entity.collider = {w = 203, h = 303}
entity.isSelected = false
entity.clickableHandCard = true
entity.cardPosition = 0
entity.buildingPrefab = 'prefabs.tower'

return entity