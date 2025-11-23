local awful = require("awful")
local wibox = require("wibox")

awful.popup {
    widget         = {
        {
            {
                markup = '<span size=\"large\"><b>TODO</b></span>',
                font   = "DejaVuSansM Nerd Font",
                widget = wibox.widget.textbox
            },
            {
                markup = "[ ] Learn lua (DOIN)",
                font   = "DejaVuSansM Nerd Font 12",
                widget = wibox.widget.textbox
            },
            {
                markup = "[X] Modularize configs (DOIN)",
                font   = "DejaVuSansM Nerd Font 12",
                widget = wibox.widget.textbox
            },
            {
                markup = "[ ] Learn widgets in awesome",
                font   = "DejaVuSansM Nerd Font 12",
                widget = wibox.widget.textbox
            },
            {
                markup = "[ ] Manage Volume controls keys with widget (on keybindins call `volume:inc(5)`)",
                font   = "DejaVuSansM Nerd Font 12",
                widget = wibox.widget.textbox
            },
            {
                markup = "[ ] Choose a theme",
                font   = "DejaVuSansM Nerd Font 12",
                widget = wibox.widget.textbox
            },
            {
                markup = "[ ] Color palette",
                font   = "DejaVuSansM Nerd Font 12",
                widget = wibox.widget.textbox
            },
            {
                markup = '<span foreground="red">[X] Config fn keys (see i3 directory)</span>',
                font   = "DejaVuSansM Nerd Font 12",
                widget = wibox.widget.textbox
            },
            {
                text = "",
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = 10,
        widget  = wibox.container.margin
    },
    minimum_width  = 200,
    minimum_height = 400,
    border_color   = "#00ff00",
    border_width   = 5,
    placement      = awful.placement.centered + awful.placement.right,
    visible        = true,
}
