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
end)
