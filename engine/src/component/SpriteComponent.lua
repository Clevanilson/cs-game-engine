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

---@alias SpriteComponentArgs {
---path: string,
---position: VectorArgs | nil,
---width: number | nil,
---height: number | nil,
---scale: VectorArgs | nil,
---}

---@param args SpriteComponentArgs
function SpriteComponent.new(args)
    local self = setmetatable({
        _path = args.path,
        _position = Vector.new(args.position or { x = 0, y = 0}),
        _width = args.width,
        _height = args.height,
        _scale = Vector.new(args.scale or { x = 1, y = 1 })
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
