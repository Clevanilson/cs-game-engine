Window = {}
Window.__index = Window

local function getRGB(value)
    return value / 255
end

function Window.new() 
    local self = setmetatable({}, Window)
    self.width = 1920
    self.height = 1080
    self.title = 'Lua Engine'
    self.vsync = true
    love.window.setTitle(self.title)
    love.window.setMode(self.width, self.height, { vsync = self.vsync })
    return self
end

function Window:clear()
    love.graphics.clear(getRGB(80), getRGB(80), getRGB(80), 1)
end
