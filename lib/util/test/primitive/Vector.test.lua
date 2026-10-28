local testing = require 'lib.testing.index'
local util = require 'lib.util.index'
local Sut = util.Vector

testing.describe('Vector', function ()
    testing.test('new', function ()
        local sut = Sut.new { x = 5, y = 10 }
        testing.expect(sut:getX()).toBe(5)
        testing.expect(sut:getY()).toBe(10)
    end)

    testing.test('sum', function ()
        local sut = Sut.new { x = 5, y = 10 }
        local other = Sut.new { x = 3, y = 7 }
        sut:sum { other = other }
        testing.expect(sut:getX()).toBe(8)
        testing.expect(sut:getY()).toBe(17)
    end)

    testing.test('subtract', function ()
        local sut = Sut.new { x = 5, y = 10 }
        local other = Sut.new { x = 3, y = 7 }
        sut:subtract { other = other }
        testing.expect(sut:getX()).toBe(2)
        testing.expect(sut:getY()).toBe(3)
    end)

    testing.test('scale', function ()
        local sut = Sut.new { x = 5, y = 10 }
        sut:scale { factor = 2 }
        testing.expect(sut:getX()).toBe(10)
        testing.expect(sut:getY()).toBe(20)
    end)

    testing.test('clone', function ()
        local sut = Sut.new { x = 1, y = 2 }
        local clone = sut:clone()
        testing.expect(sut == clone).toBe(false)
        testing.expect(sut:getX()).toBe(clone:getX())
        testing.expect(sut:getY()).toBe(clone:getY())
    end)

    testing.test('limit', function ()
        local sut = Sut.new { x = 1, y = 2 }
        local sub = Sut.new { x = 5, y = 5 }
        local sum = Sut.new { x = 15, y = 15 }
        sut:limit { min = 0, max = 3 }
        sut:subtract { other = sub }
        testing.expect(sut:getX()).toBe(0)
        testing.expect(sut:getY()).toBe(0)
        sut:sum { other = sum }
        testing.expect(sut:getX()).toBe(3)
        testing.expect(sut:getY()).toBe(3)
    end)

    testing.test('setX', function ()
        local sut = Sut.new { x = 0, y = 0}
        sut:setX(1)
        testing.expect(sut:getX()).toBe(1)
        testing.expect(sut:getY()).toBe(0)
    end)

    testing.test('setY', function ()
        local sut = Sut.new { x = 0, y = 0}
        sut:setY(1)
        testing.expect(sut:getX()).toBe(0)
        testing.expect(sut:getY()).toBe(1)
    end)
end)
