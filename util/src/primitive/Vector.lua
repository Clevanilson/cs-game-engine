---@class Vector
---@field _x number
---@field _y number
local Vector = {}
Vector.__index = Vector

---@param args { x: number, y: number }
---@return Vector
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

---@param args { other: Vector } 
function Vector:sum(args)
    local other = args.other
    self._x = self._x + other:getX()
    self._y = self._y + other:getY()
end

---@param args { other: Vector } 
function Vector:subtract(args)
    local other = args.other
    self._x = self._x - other:getX()
    self._y = self._y - other:getY()
end

---@param args { factor: number } 
function Vector:scale(args)
    local factor = args.factor
    self._x = self._x * factor
    self._y = self._y * factor
end

return Vector
