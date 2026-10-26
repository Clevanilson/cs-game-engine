local Vector = {}
Vector.__index = Vector

function Vector.new(args)
    local self = {
        _x = args.x,
        _y = args.y
    }
    return setmetatable(self, Vector)
end

function Vector:getX()
    return self._x
end

function Vector:getY()
    return self._y
end

function Vector:sum(args)
    local other = args.other
    self._x = self._x + other:getX()
    self._y = self._y + other:getY()
end

function Vector:subtract(args)
    local other = args.other
    self._x = self._x - other:getX()
    self._y = self._y - other:getY()
end

function Vector:scale(args)
    local factor = args.factor
    self._x = self._x * factor
    self._y = self._y * factor
end

return Vector
