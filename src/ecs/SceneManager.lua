SceneManager = {}
SceneManager.__index = SceneManager

function SceneManager.new()
    local self = {
        currentScene = nil
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
    self.currentScene:update(dt)
end
