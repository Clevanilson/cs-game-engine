local Component = require 'engine.src.ecs.Component'

local TextComponent = setmetatable({ id = Component.getNextID() }, Component)
TextComponent.__index = TextComponent

function TextComponent.new(args)
    local self = {
        _text = args.text
    }
    return setmetatable(self, TextComponent)
end

function TextComponent:getText()
    return self._text
end

return TextComponent