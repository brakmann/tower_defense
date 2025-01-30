local love = require 'love'

local entity = {}

entity.enemyTag = true
entity.sprite = love.graphics.newImage("/sprites/drafts/human.png", {mipmaps = true})
entity.screenPosition = {x = 500, y = 500}
--entity.targetId = 0 присваивается
entity.targetPosition = {x = 500, y = 500}
entity.speed = 0.1
entity.HP = 3
entity.attackFrequency = 1
entity.attackCooldown = 1
entity.damage = 1

return entity