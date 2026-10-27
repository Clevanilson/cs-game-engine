local testDir = arg[1] or '.'

---@param path string
---@return table<number, string>
local function readDir(path)
    local handle = io.popen('ls ./' .. path)
    local buffer = {}
    local index = 1

    if handle == nil then
        return buffer
    end

    for line in handle:lines() do
        buffer[index] = line
        index = index + 1
    end

    handle:close()

    return buffer
end

---@param path string
---@return string
local function readFile(path)
    local file = io.open(path)

    if file == nil then
         return ''
    end

    local content = file:read('*a')
    file:close()
    return content
end

local function isDir(fileName)
    return fileName:sub(-4) ~= '.lua'
end

local function isTestFile(fileName)
    local testFilePattern ='.test.lua'
    return fileName:sub(-#testFilePattern) == testFilePattern
end

---@param path string
local function runTestFile(path)
    local chunk, _error = load(readFile(path))

    if chunk then
        print(path)
        chunk()
    end
end

---@param rootDirPath string
local function runTests(rootDirPath)
    for _key, fileName in ipairs(readDir(rootDirPath)) do
        if isDir(fileName) then
            runTests(rootDirPath .. '/' .. fileName)
        else
            local fullFileName = rootDirPath .. '/' .. fileName
            if isTestFile(fullFileName) then
                runTestFile(fullFileName)
            end
        end
    end
end



runTests(testDir)