local Component = require 'engine.src.ecs.Component'
local Vector = require 'lib.util.index'.Vector

---@class SpriteComponent : Component
---@field _path string
---@field _position Vector
---@field _width number
---@field _height number
---@field _scale Vector
local SpriteComponent = setmetatable({ _id = Component.getNextID() }, Component)
SpriteComponent.__index = SpriteComponent

---@param args {
---path: string,
---position: Vector,
---width: number,
---height: number,
---scale: Vector,
---}
function SpriteComponent.new(args)
    local self = setmetatable({
        _path = args.path,
        _position = args.position or Vector.new { x = 0, y = 0},
        _width = args.width or 16,
        _height = args.height or 16,
        _scale = args.scale or Vector.new { x = 1, y = 1 }
    }, Component.new())
    return setmetatable(self, SpriteComponent)
end

function SpriteComponent:getPath()
    return self._path
end

function SpriteComponent:getScale()
    return self._scale
end

function SpriteComponent:getPosition()
    return self._position
end

function SpriteComponent:getWidth()
    return self._width
end

function  SpriteComponent:getHeight()
    return self._height
end

return SpriteComponent
