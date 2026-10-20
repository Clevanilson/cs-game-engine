Vector = {}
Vector.__index = Vector

function Vector:new(x, y)
    local self = setmetatable({}, Vector)
    self.x = x
    self.y = y
    return self
end