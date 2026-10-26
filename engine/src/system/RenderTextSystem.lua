local util = require 'util.index'
local Vector = util.Vector
local System = require 'engine.src.ecs.System'
local TransformComponent = require 'engine.src.component.TransformComponent'
local TextComponent = require 'engine.src.component.TextComponent'

local RenderTextSystem = setmetatable({}, System)
RenderTextSystem.__index = RenderTextSystem

function RenderTextSystem.new()
    local self = System.new()
    self:require { ComponentClass = TransformComponent }
    self:require { ComponentClass = TextComponent }
    return setmetatable(self, RenderTextSystem)
end

function RenderTextSystem:render()
    for _key, entity in pairs(self:getEntities()) do
        local transform = entity:getComponent { ComponentClass = TransformComponent }
        local position = transform:getPosition()
        local text = entity:getComponent { ComponentClass = TextComponent }
        love.graphics.print(text:getText(), position:getX())
    end
end

return RenderTextSystem
