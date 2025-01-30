local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/tile.png", {mipmaps = true})
entity.tilePosition = {x = 0, y = 0}
entity.collider = {w = 105, h = 105}
entity.tileTag = true
entity.isFree = true

return entity