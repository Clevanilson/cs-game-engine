---@alias ExpectReturn {
--- toBe: fun(value: any)
---}
---
---@alias TestingModule {
--- describe: fun(message: string, callback: function),
--- test: fun(message: string, callback: function),
--- expect: fun(value: any): ExpectReturn,
---}


---@type TestingModule
return {
    describe = function (message, callback)
        print(message)
        callback()
    end,

    test = function (message, callback)
        local success, errorMessage = pcall(callback)
        local icon = success and  '✅' or '❌'
        print(icon .. '  ' .. message)

        if success then
            return
        end

        print('   -> ' .. errorMessage)
    end,

    expect = function (value1)
        return {
            toBe = function (value2)
                if not (value1  == value2) then
                    error("Expected " .. tostring(value1) .. ' to be ' .. tostring(value2), 0)
                end
            end
        }
    end
}
