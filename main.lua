local love = require 'love'
local becs = require 'engine.becs'

function love.load()
    becs.initializeWorld()
    print("hello")
end