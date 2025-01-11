local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/human.png", {mipmaps = true})
entity.screenPosition = {x = 150, y = 150}
--entity.targetId = 0 присваивается
entity.targetPosition = {x = 1000, y = 1000}
entity.speed = 0.1
entity.HP = 3
entity.damageFrequency = 1
entity.damageCooldown = 1
entity.damage = 1

return entity