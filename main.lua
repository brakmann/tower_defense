local love = require 'love'
local becs = require 'engine.becs'
local tools = require 'engine.tools'


function love.load()
    becs.initializeWorld()
    generateLevel()
    local enemy = tools.deepcopy(require('prefabs.enemy'))
    becs.addEntityToWorld(enemy)
    
    local card1 = tools.deepcopy(require('prefabs.card_magic_collector'))
    becs.addEntityToWorld(card1)
    local card2 = tools.deepcopy(require('prefabs.card_magic_guard'))
    becs.addEntityToWorld(card2)

    becs.addEntityToWorld(require('prefabs.take_card_button'))
    becs.addEntityToWorld(require('prefabs.resource_storage'))

    becs.addSystemToWorld(require 'systems.damage.death')
    becs.addSystemToWorld(require 'systems.damage.enemy_melee_attack')
    becs.addSystemToWorld(require 'systems.damage.tower_shot')

    becs.addSystemToWorld(require 'systems.movement.target_definer')
    becs.addSystemToWorld(require 'systems.movement.movement')

    becs.addSystemToWorld(require 'systems.resources.resource_collector')

    becs.addSystemToWorld(require 'systems.view.apply_position')
    becs.addSystemToWorld(require 'systems.view.click_hand_card')
    becs.addSystemToWorld(require 'systems.view.click_take_card')
    becs.addSystemToWorld(require 'systems.view.click_tile')
    becs.addSystemToWorld(require 'systems.view.hand_renderer')

    love.graphics.setBackgroundColor(love.math.colorFromBytes(201, 233, 254))

    love.handlers['cardpressed'] = cardPressed
end

function cardPressed()
    --becs.callSystems('OnCardPressed')
end

function love.mousepressed(x, y, mouseButton)
    if mouseButton == 1 then
      becs.addClickedTags(x, y)
      becs.callSystems('OnClick')
      becs.removeClickedTags()
    end
end

function love.update()
    becs.callSystems('OnUpdate')
    becs.destroy()
end

function love.draw()
    becs.renderSprites()
    local storage = becs.getFirstEntity({"resourceStorageTag"})
    if storage then 
        love.graphics.print(storage.magicAmount, 20, 500)
        love.graphics.print(storage.techAmount, 20, 520)
        love.graphics.print(storage.alchAmount, 20, 540)
    end   
end

function generateLevel()
    local tile = tools.deepcopy(require('prefabs.tile'))
    tile.tilePosition.x = 1
    tile.tilePosition.y = 1
    becs.addEntityToWorld(tile)

    tile = tools.deepcopy(require('prefabs.tile'))
    tile.tilePosition.x = 2
    tile.tilePosition.y = 1
    becs.addEntityToWorld(tile)

    tile = tools.deepcopy(require('prefabs.tile'))
    tile.tilePosition.x = 3
    tile.tilePosition.y = 1
    becs.addEntityToWorld(tile)
end