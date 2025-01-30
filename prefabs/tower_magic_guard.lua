local love = require 'love'

local entity = {}

entity.towerTag = true
entity.sprite = love.graphics.newImage("/sprites/drafts/tower_guard_red.png", {mipmaps = true})
entity.cost = {magic = 3, tech = 0, alch = 0}
entity.screenPosition = {x = 10, y = 10}
entity.attackFrequency = 3
entity.attackCooldown = 3
entity.projectilePrefab = 'prefabs.projectile'
entity.HP = 3

return entity