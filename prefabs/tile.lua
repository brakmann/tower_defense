local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/tile.png", {mipmaps = true})
entity.tilePosition = {x = 0, y = 0}
entity.screenPosition = {x = 0, y = 0}
entity.collider = {w = 141, h = 126}
entity.tileTag = true
entity.isFree = true

return entity