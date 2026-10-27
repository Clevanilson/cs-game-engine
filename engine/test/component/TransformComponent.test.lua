local testing = require 'lib.testing.index'
local util = require 'lib.util.index'
local engine = require 'engine.index'
local Vector = util.Vector
local Sut = engine.TransformComponent

testing.describe('TransformComponent', function ()
    testing.test('new', function ()
        local position = Vector.new { x = 1, y = 2 }
        local sut = Sut.new {
            position = position,
            rotation = 90
        }
        testing.expect(sut:getPosition()).toBe(position)
        testing.expect(sut:getRotation()).toBe(90)
        testing.expect(sut:getID()).toBe(Sut:getID())
    end)

    testing.test('new defaults', function ()
        local position = Vector.new { x = 0, y = 0 }
        local sut = Sut.new { position = position }
        testing.expect(sut:getRotation()).toBe(0)
    end)
end)
