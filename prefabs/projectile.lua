local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/projectile.png", {mipmaps = true})
entity.screenPosition = {x = 500, y = 500}
--entity.targetId = 0 присваивается
entity.targetPosition = {x = 500, y = 500}
entity.speed = 10
entity.damage = 1

return entity