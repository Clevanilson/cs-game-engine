local util = require 'lib.util.index'
local testing = require 'lib.testing.index'
local Vector = util.Vector
local Sut = require 'engine.src.component.RigidBodyComponent'

testing.describe('RigidBodyComponent', function ()
    testing.test('new', function ()
        local velocity = Vector.new { x = 200, y = 10 }
        local sut = Sut.new { velocity = velocity }
        testing.expect(sut:getVelocity()).toBe(velocity)
        testing.expect(sut:getID()).toBe(Sut:getID())
    end)
end)
