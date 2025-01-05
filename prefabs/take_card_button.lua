local love = require 'love'

local entity = {}

entity.sprite = love.graphics.newImage("/sprites/drafts/take_card_button.png", {mipmaps = true})
entity.screenPosition = {x = 300, y = 300}
entity.collider = {w = 100, h = 50}
entity.takeCardButtonTag = true

return entity