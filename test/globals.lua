function Describe(message, callback)
    print(message)
    callback()
end

function Test(message, callback)
    local success, errorMessage = pcall(callback)
    local icon = success and  '✅' or '❌'
    print(icon .. '  ' .. message)

    if success then
        return
    end

    print('   -> ' .. errorMessage)
end

function Expect(value1)
    return {
        toBe = function (value2)
            if not (value1  == value2) then
                error("Expected " .. tostring(value1) .. ' to be ' .. tostring(value2), 0)
            end
        end
    }
end