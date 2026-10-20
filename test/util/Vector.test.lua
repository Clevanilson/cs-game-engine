require 'test.globals'
require 'src.util.Vector'

Describe('Vector', function ()
    Test('new', function ()
        local sut = Vector.new(5, 10)
        Expect(sut:getX()).toBe(5)
        Expect(sut:getY()).toBe(10)
    end)

    Test('sum', function ()
        local sut = Vector.new(5, 10)
        local other = Vector.new(3, 7)
        sut:sum(other)
        Expect(sut:getX()).toBe(8)
        Expect(sut:getY()).toBe(17)
    end)

    Test('subtract', function ()
        local sut = Vector.new(5, 10)
        local other = Vector.new(3, 7)
        sut:subtract(other)
        Expect(sut:getX()).toBe(2)
        Expect(sut:getY()).toBe(3)
    end)
end)