local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/human.png", {mipmaps = true})
entity.screenPosition = {x = 150, y = 150}
entity.targetPosition = {x = 1000, y = 1000}
entity.speed = 0.1


return entity