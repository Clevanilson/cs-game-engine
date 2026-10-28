local EntityManager = require 'engine.src.ecs.EntityManager'
local RenderSpriteSystem = require 'engine.src.system.RenderSpriteSystem'
local CameraMovementSystem = require 'engine.src.system.CameraMovementSystem'
local ScriptSystem = require 'engine.src.system.ScriptSystem'

---@alias SceneData {
---     entities: table<number, {
---         components: {
---             TransformComponent: TransformComponentArgs | nil,
---             SpriteComponent: SpriteComponentArgs | nil,
---             ScriptComponent: ScriptComponentArgs | nil,
---             CameraFollowComponent: {} | nil,
---         },
---     }>,
---}

---@class Scene
---@field _entityManager EntityManager
---@field _systems {
---renderSprite: RenderSpriteSystem,
---cameraMovement: CameraMovementSystem,
---script: ScriptSystem,
---}
local Scene = {}
Scene.__index = Scene

function Scene.new()
    local self = {
        _entityManager = EntityManager.new(),
        _systems = {
            renderSprite = RenderSpriteSystem.new(),
            cameraMovement = CameraMovementSystem.new(),
            script = ScriptSystem.new()
        }
    }
    self._entityManager:addSystem(self._systems.renderSprite)
    self._entityManager:addSystem(self._systems.cameraMovement)
    self._entityManager:addSystem(self._systems.script)
    return setmetatable(self, Scene)
end

function Scene:getSystems()
    return self._systems
end

function Scene:init()
end

function Scene:destroy()
end

function Scene:getEntityManager()
    return self._entityManager
end

return Scene
