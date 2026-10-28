local Util = require 'lib.util.index'
local Component = require 'engine.src.ecs.Component'

---@class TransformComponent : Component
---@field _position Vector
---@field _rotation number
local TransformComponent = setmetatable({ _id = Component.getNextID() }, Component)
TransformComponent.__index = TransformComponent

---@alias TransformComponentArgs {
---     position: VectorArgs,
---}

---@param args TransformComponentArgs
---@return TransformComponent
function TransformComponent.new(args)
    local self = setmetatable({
        _position = Util.Vector.new(args.position or {}),
    }, Component.new())
    return setmetatable(self, TransformComponent)
end

function TransformComponent:getPosition()
    return self._position
end


return TransformComponent
