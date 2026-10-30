---@class AssetStore
---@field private _loadedAssets table<string, love.Image>
local AssetStore = {}
AssetStore.__index = AssetStore

local instance = nil

---@private
function AssetStore.new()
    local self = setmetatable({}, AssetStore)
    self._loadedAssets = {}
    return self
end

---@return AssetStore
function AssetStore.getInstance()
    if not instance then
        instance = AssetStore.new()
    end

    return instance
end

---@param path string
---@return love.Image
function AssetStore:getImage(path)
    if not self._loadedAssets[path] then
        self._loadedAssets[path] = love.graphics.newImage(path)
    end

    return self._loadedAssets[path]
end

return AssetStore