local engineUtil = require 'engine.src.util.index'

---@class SceneManager
---@field currentScene Scene
---@field _camera Camera
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
    systems.keyboardControl:update(dt)
    systems.cameraMovement:update(dt, self._camera)
end

function SceneManager:render()
    if not self.currentScene then return end
    local canvas = love.graphics.newCanvas(self._camera:getWidth(), self._camera:getHeight())
    love.graphics.setCanvas(canvas)
    local systems = self.currentScene:getSystems()
    systems.renderText:render(self._camera)
    systems.renderSprite:render(self._camera)
    love.graphics.setCanvas()
    local window_width = love.graphics:getWidth()
    local window_height = love.graphics:getHeight()
    love.graphics.draw(
        canvas,
        0, 0,
        0,
        window_width / self._camera:getWidth(),
        window_height / self._camera:getHeight()
    )
end

return SceneManager
