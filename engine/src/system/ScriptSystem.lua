local System = require 'engine.src.ecs.System'
local ScriptComponent = require 'engine.src.component.ScriptComponent'
local TransformComponent = require 'engine.src.component.TransformComponent'

---@class ScriptSystem : System
local ScriptSystem = setmetatable({}, System)
ScriptSystem.__index = ScriptSystem

local keys = {}

function love.keypressed(key)
    keys[key] = true
end

function love.keyreleased(key)
    keys[key] = false
end

function ScriptSystem.new()
    local self = System.new()
    self:require { ComponentClass = ScriptComponent }
    return setmetatable(self, ScriptSystem)
end

function ScriptSystem:update(dt)
    for _key, entity in pairs(self:getEntities()) do
        ---@type ScriptComponent
        local script = entity:getComponent(ScriptComponent)
        script.callback({ 
            dt = dt,
            keys = keys,
            entity = entity,
            setPosition = function (x, y)
                ---@type TransformComponent
                local transform = entity:getComponent(TransformComponent)
                local position = transform:getPosition()
                position:setX(x)
                position:setY(y)
            end,
            getPosition = function ()
                ---@type TransformComponent
                local transform = entity:getComponent(TransformComponent)
                local position = transform:getPosition()
                return position:getX(), position:getY()
            end

        })
    end
end

return ScriptSystem
