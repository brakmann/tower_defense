local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/drop_red.png", {mipmaps = true})
entity.screenPosition = {x = 10, y = 10}

return entity