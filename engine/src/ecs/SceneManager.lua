local engineUtil = require 'engine.src.util.index'

local SceneManager = {}
SceneManager.__index = SceneManager

function SceneManager.new()
    local self = {
        currentScene = nil,
        _camera = engineUtil.Camera.new()
   }
    return setmetatable(self, SceneManager)
end

function SceneManager:set(newScene)
    if self.currentScene then 
        self.currentScene:destroy()
    end

    self.currentScene = newScene
    self.currentScene:init()
end

function SceneManager:update(dt)
    if not self.currentScene then return end
    self.currentScene:getEntityManager():update()
    local systems = self.currentScene:getSystems()
    systems.movement:update(dt)
    systems.cameraMovement:update(dt, self._camera)
end

function SceneManager:render()
    if not self.currentScene then return end
    local systems = self.currentScene:getSystems()
    systems.renderText:render(self._camera)
    systems.renderSprite:render(self._camera)
end

return SceneManager
