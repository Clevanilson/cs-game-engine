---@class Vector
---@field _x number
---@field _y number
---@field _minX number | nil
---@field _maxX number | nil
---@field _minY number | nil
---@field _maxY number | nil
local Vector = {}
Vector.__index = Vector

---@alias LimitArgs { min: number | nil, max: number | nil }

---@param args { x: number, y: number }
---@return Vector
function Vector.new(args)
    local self = {
        _x = args.x or 0,
        _y = args.y or 0,
        _minX = nil,
        _maxX = nil,
        _minY = nil,
        _maxY = nil
    }
    return setmetatable(self, Vector)
end

function Vector:_updateLimits()
    self:limitX { max = self._maxX, min = self._minX }
    self:limitY { max = self._maxY, min = self._minY }
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
    self:_updateLimits()
end

---@param args { other: Vector } 
function Vector:subtract(args)
    local other = args.other
    self._x = self._x - other:getX()
    self._y = self._y - other:getY()
    self:_updateLimits()
end

---@param args { factor: number } 
function Vector:scale(args)
    local factor = args.factor
    self._x = self._x * factor
    self._y = self._y * factor
end

---@param args LimitArgs
function Vector:limit(args)
    self:limitX(args)
    self:limitY(args)
end

---@param args LimitArgs
function Vector:limitX(args)
    self._maxX = args.max
    self._minX = args.min

    self._maxX = args.max
    self._minX = args.min

    if self._minX ~= nil then 
        self._x = math.max(self._minX, self._x)
    end

    if self._maxX ~= nil then 
        self._x = math.min(self._maxX, self._x)
    end
end

---@param args LimitArgs
function Vector:limitY(args)
    self._maxY = args.max
    self._minY = args.min

    if self._minY ~= nil then
        self._y = math.max(self._minY, self._y)
    end

    if self._maxY ~= nil then
        self._y = math.min(self._maxY, self._y)
    end
end


function Vector:clone()
    return Vector.new { x = self:getX(), y = self:getY() }
end

return Vector
