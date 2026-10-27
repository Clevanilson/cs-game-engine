local util = require 'lib.util.index'
local engine = require 'engine.index'
local testing = require 'lib.testing.index'
local Vector = util.Vector
local Sut = engine.RigidBodyComponent

testing.describe('RigidBodyComponent', function ()
    testing.test('new', function ()
        local velocity = Vector.new { x = 200, y = 10 }
        local sut = Sut.new { velocity = velocity }
        testing.expect(sut:getVelocity()).toBe(velocity)
        testing.expect(sut:getID()).toBe(Sut:getID())
    end)
end)
