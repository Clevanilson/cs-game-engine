Scene = {}
Scene.__index = Scene

function Scene.new(entityManager)
    local self = {
        entityManager = entityManager
    }
    return setmetatable(self, Scene)
end

function Scene:init()
end

function Scene:update(dt)
end

function Scene:destroy()
end
