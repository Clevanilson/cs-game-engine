local Component = require 'engine.src.ecs.Component'

---@class TextComponent : Component
---@field _text string
local TextComponent = setmetatable({ _id = Component.getNextID() }, Component)
TextComponent.__index = TextComponent

---@return TextComponent
function TextComponent.new(args)
    local self = setmetatable({
        _text = args.text
    }, Component.new())
    return setmetatable(self, TextComponent)
end

function TextComponent:getText()
    return self._text
end

return TextComponent