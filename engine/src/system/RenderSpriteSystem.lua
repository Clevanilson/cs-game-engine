local System = require 'engine.src.ecs.System'
local TransformComponent = require 'engine.src.component.TransformComponent'
local SpriteComponent = require 'engine.src.component.SpriteComponent'

---@class RenderSpriteSystem : System
local RenderSpriteSystem = setmetatable({}, System)
RenderSpriteSystem.__index = RenderSpriteSystem

local store = {}

---@param args { path: string }
function store:get(args)
    local spritePath = args.path
    local sprite = store[spritePath]

    if sprite then
        return sprite
    end

    store[spritePath] = love.graphics.newImage(spritePath)
    return store[spritePath]
end

function RenderSpriteSystem.new()
    local self = System.new()
    self:require { ComponentClass = TransformComponent }
    self:require { ComponentClass = SpriteComponent }
    return setmetatable(self, RenderSpriteSystem)
end

---@param camera Camera
function RenderSpriteSystem:render(camera)
    for _key, entity in pairs(self:getEntities()) do
        ---@type TransformComponent
        local cTransform = entity:getComponent(TransformComponent)
        ---@type SpriteComponent
        local cSprite = entity:getComponent(SpriteComponent)
        local spriteData = entity:getComponent(SpriteComponent)
        local sprite = store:get{ path = spriteData:getPath() }
        local quad = love.graphics.newQuad(
            cSprite:getPosition():getX(),
            cSprite:getPosition():getY(),
            cSprite:getWidth() or sprite:getWidth(), 
            cSprite:getHeight() or sprite:getHeight(),
            sprite:getDimensions()
        )
        love.graphics.draw(
            sprite,
            quad, 
            cTransform:getPosition():getX() - camera:getPosition():getX(), 
            cTransform:getPosition():getY() - camera:getPosition():getY(), 
            0, 
            camera:getZoom(), 
            camera:getZoom()
        )
    end
end

return RenderSpriteSystem
