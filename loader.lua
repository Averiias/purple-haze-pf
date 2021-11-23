local script_details = {
    debug = false,
    version = "1.0.0",
}

local url = script_details.debug and "http://localhost:6845" or "https://raw.githubusercontent.com/Averiias/purple-haze-pf/main"

local out = script_details.debug and function(T, ...)
    return warn("[purple haze - debug]: "..T:format(...))
end or function() end

local function import(file)
    out("Importing File \"%s\"", file)
    -- return task.spawn(function()
    local x, a = pcall(function()
        return loadstring(game:HttpGet(url .. file))()
    end)
    if not x then
        return warn('failed to import', file)
    end
    -- end)
end

getgenv().import = import
getgenv().details = scriptdetails

import('/main.lua')