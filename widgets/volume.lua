require("core.common")

local mod_value = 5
local get_volume_cmd = "pulsemixer --get-volume"
local mod_volume_cmd = "pulsemixer --max-volume 100 --change-volume "

local full_current = ""
local current_volume = ""

local volume = {}

function volume:inc()
    Awful.spawn.easy_async(mod_volume_cmd .. "+" .. mod_value, function() end)
end

function volume:dec()
    Awful.spawn.easy_async(mod_volume_cmd .. "-" .. mod_value, function() end)
end

function volume:get_volume()
    Awful.spawn.easy_async(get_volume_cmd, function(out)
        full_current = out
        current_volume = string.sub(out, string.find(full_current, "%d+"))
    end)
    return current_volume
end

return volume
