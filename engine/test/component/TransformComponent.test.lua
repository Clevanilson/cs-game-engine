local util = require 'util.index'
local engine = require 'engine.index'
local testing = util.testing
local Vector = util.Vector
local TransformComponent = engine.TransformComponent

testing.describe('TransformComponent', function ()
    testing.test('new', function ()
        local position = Vector.new { x = 1, y = 2 }
        local sut = TransformComponent.new {
            position = position,
            rotation = 90
        }
        testing.expect(sut:getPosition()).toBe(position)
        testing.expect(sut:getRotation()).toBe(90)
        testing.expect(sut:getID()).toBe(TransformComponent:getID())
    end)

    testing.test('new defaults', function ()
        local position = Vector.new { x = 0, y = 0 }
        local sut = TransformComponent.new { position = position }
        testing.expect(sut:getRotation()).toBe(0)
    end)
end)
