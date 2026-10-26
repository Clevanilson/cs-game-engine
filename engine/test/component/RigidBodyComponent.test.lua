local util = require 'util.index'
local engine = require 'engine.index'
local testing = util.testing
local Vector = util.Vector
local RigidBodyComponent = engine.RigidBodyComponent

testing.describe('RigidBodyComponent', function ()
    testing.test('new', function ()
        local velocity = Vector.new { x = 200, y = 10 }
        local sut = RigidBodyComponent.new { velocity = velocity }
        testing.expect(sut:getVelocity()).toBe(velocity)
        testing.expect(sut:getID()).toBe(RigidBodyComponent:getID())
    end)
end)
