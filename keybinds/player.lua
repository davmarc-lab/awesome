require("core.common")

local volume = require("widgets.volume")

return Gears.table.join(
    Awful.key({}, "XF86AudioRaiseVolume", function()
            volume:inc()
            Naughty.notify { text = "VOL: " .. volume:get_volume() }
        end,
        { description = "increase volume", group = "player" }),
    Awful.key({}, "XF86AudioLowerVolume", function()
            volume:dec()
            Naughty.notify { text = "VOL: " .. volume:get_volume() }
        end,
        { description = "decrease volume", group = "player" }),
    Awful.key({}, "XF86AudioMute", function()
            Awful.spawn.with_shell("pulsemixer --toggle-mute")
        end,
        { description = "toggle mute", group = "player" }),
    Awful.key({}, "XF86AudioMicMute", function()
            Awful.spawn.with_shell("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
        end,
        { description = "toggle mic mute", group = "player" }),
    Awful.key({}, "XF86AudioPlay", function()
            Awful.spawn.with_shell("playerctl play-pause")
        end,
        { description = "player play/pause", group = "player" }),
    Awful.key({}, "XF86AudioStop", function()
            Awful.spawn.with_shell("playerctl stop")
        end,
        { description = "player stop", group = "player" }),
    Awful.key({}, "XF86AudioPrev", function()
            Awful.spawn.with_shell("playerctl previous")
        end,
        { description = "player prev", group = "player" }),
    Awful.key({}, "XF86AudioNext", function()
            Awful.spawn.with_shell("playerctl next")
        end,
        { description = "player next", group = "player" })
)
