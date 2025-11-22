require("core.common")

return Gears.table.join(
    Awful.key({ Modkey, }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),
    Awful.key({ Modkey, "Shift" }, "q", function(c) c:kill() end,
        { description = "close", group = "client" }),
    Awful.key({ Modkey, "Control" }, "space", Awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),
    Awful.key({ Modkey, "Control" }, "Return", function(c) c:swap(Awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),
    Awful.key({ Modkey, }, "o", function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" }),
    Awful.key({ Modkey, }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),
    Awful.key({ Modkey, }, "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "minimize", group = "client" }),
    Awful.key({ Modkey, }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = "client" }),
    Awful.key({ Modkey, "Control" }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description = "(un)maximize vertically", group = "client" }),
    Awful.key({ Modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        { description = "(un)maximize horizontally", group = "client" })
)
