require("core.common")

local mod_value = 5
local get_volume_cmd = "pulsemixer --get-volume"
local mod_volume_cmd = "pulsemixer --max-volume 100 --change-volume "
local mute_volume_cmd = "pulsemixer --toggle-mute"

local full_current = ""
local current_volume = ""

Volume = {}

function Volume:inc()
    Awful.spawn.easy_async_with_shell(mod_volume_cmd .. "+" .. mod_value .. " && " .. get_volume_cmd, function(out)
        full_current = out
        current_volume = string.sub(out, string.find(out, "%d+"))
    end)
end

function Volume:dec()
    Awful.spawn.easy_async_with_shell(mod_volume_cmd .. "-" .. mod_value .. " && " .. get_volume_cmd, function(out)
        full_current = out
        current_volume = string.sub(out, string.find(out, "%d+"))
    end)
end

function Volume:toggle_mute()
    Awful.spawn.easy_async(mute_volume_cmd, function() end)
end

function Volume:get_volume()
    return current_volume
end

function Volume:get_left_right()
    return full_current
end

return Volume
