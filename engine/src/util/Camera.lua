local mUtil = require 'lib.util.index'
local Vector = mUtil.Vector

---@class Camera
---@field _position Vector
---@field _width number
---@field _height number
---@field _zoom number
local Camera = {}
Camera.__index = Camera

function Camera.new()
    local self = {
        _position = Vector.new { x = 0, y = 0 },
        _width = 500,
        _height = 500 ,
        _zoom = 3
    }
    return setmetatable(self, Camera)
end

function Camera:getPosition()
    return self._position
end

function Camera:getWidth()
    return self._width
end

function Camera:getHeight()
    return self._height
end

function Camera:getZoom()
    return self._zoom
end

return Camera