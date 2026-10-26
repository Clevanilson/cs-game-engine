local util = require 'util.index'
local engine = require 'engine.index'

local TestScene = setmetatable({}, engine.Scene)
TestScene.__index = TestScene

function TestScene.new()
    local self = engine.Scene.new()
    return setmetatable(self, TestScene)
end

function TestScene:init()
    local entityManager = self:getEntityManager()
    local textEntity = entityManager:createEntity()
    textEntity:addComponent {
       component = engine.TextComponent.new({ text = 'hello' })
    }
    textEntity:addComponent {
        component = engine.TransformComponent.new { 
            position = util.Vector.new {
                x = 1,
                y = 2
            }
        }
    }
    entityManager:addSystem(
        engine.RenderTextSystem.new()
    )
end





function TestScene:destroy()
    print('[TesteScene]: destroy')
end

return TestScene
