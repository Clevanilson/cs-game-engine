local EntityManager = require 'engine.src.ecs.EntityManager'

local Scene = {}
Scene.__index = Scene

function Scene.new()
    local self = {
        _entityManager = EntityManager.new()
    }
    return setmetatable(self, Scene)
end

function Scene:init()
end

function Scene:destroy()
end

function Scene:getEntityManager()
    return self._entityManager
end

return Scene
