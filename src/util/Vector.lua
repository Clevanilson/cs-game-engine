Vector = {}
Vector.__index = Vector

function Vector.new(x, y)
    local self = {
        _x = x,
        _y = y
    }
    return setmetatable(self, Vector)
end

function Vector:getX()
    return self._x
end

function Vector:getY()
    return self._y
end

function Vector:sum(other)
    self._x = self._x + other:getX()
    self._y = self._y + other:getY()
end

function Vector:subtract(other)
    self._x = self._x - other:getX()
    self._y = self._y - other:getY()
end

function Vector:scale(factor)
    self._x = self._x * factor
    self._y = self._y * factor
end