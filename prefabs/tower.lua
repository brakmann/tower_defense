local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/drop_red.png", {mipmaps = true})
entity.cost = {magic = 3, tech = 0, alch = 0}
entity.screenPosition = {x = 10, y = 10}
entity.resourceCollectorFrequency = 5
entity.resourceCollectorCooldown = 5


return entity