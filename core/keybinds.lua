require("core.common")

-- TO MOVE SOMEWHERE ELSE MENU KEYBIND
local mymainmenu = require("modules.menu")

return Gears.table.join(
    Awful.key({ Modkey, }, "s", Hotkeys_popup.show_help,
        { description = "show help", group = "awesome" }),
    Awful.key({ Modkey, }, "Left", Awful.tag.viewprev,
        { description = "view previous", group = "tag" }),
    Awful.key({ Modkey, }, "Right", Awful.tag.viewnext,
        { description = "view next", group = "tag" }),
    Awful.key({ Modkey, }, "Escape", Awful.tag.history.restore,
        { description = "go back", group = "tag" }),

    Awful.key({ Modkey, }, "j",
        function()
            Awful.client.focus.byidx(-1)
        end,
        { description = "focus next by index", group = "client" }
    ),
    Awful.key({ Modkey, }, "k",
        function()
            Awful.client.focus.byidx(1)
        end,
        { description = "focus previous by index", group = "client" }
    ),
    Awful.key({ Modkey, }, "w", function() mymainmenu:show() end,
        { description = "show main menu", group = "awesome" }),

    -- Layout manipulation
    Awful.key({ Modkey, "Shift" }, "j", function() Awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }),
    Awful.key({ Modkey, "Shift" }, "k", function() Awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }),
    Awful.key({ Modkey, "Control" }, "j", function() Awful.screen.focus_relative(-1) end,
        { description = "focus the next screen", group = "screen" }),
    Awful.key({ Modkey, "Control" }, "k", function() Awful.screen.focus_relative(1) end,
        { description = "focus the previous screen", group = "screen" }),
    Awful.key({ Modkey, }, "u", Awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),
    Awful.key({ Modkey, }, "Tab",
        function()
            Awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),

    -- Standard program
    Awful.key({ Modkey, }, "Return", function() Awful.spawn(Terminal) end,
        { description = "open a terminal", group = "launcher" }),
    Awful.key({ Modkey, "Shift" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    Awful.key({ Modkey, "Shift" }, "e", awesome.quit,
        { description = "quit awesome", group = "awesome" }),
    Awful.key({ Modkey, }, "l", function() Awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout" }),
    Awful.key({ Modkey, }, "h", function() Awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = "layout" }),
    Awful.key({ Modkey, "Shift" }, "h", function() Awful.tag.incnmaster(1, nil, true) end,
        { description = "increase the number of master clients", group = "layout" }),
    Awful.key({ Modkey, "Shift" }, "l", function() Awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = "layout" }),
    Awful.key({ Modkey, "Control" }, "h", function() Awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),
    Awful.key({ Modkey, "Control" }, "l", function() Awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),
    Awful.key({ Modkey, }, "space", function() Awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    Awful.key({ Modkey, "Shift" }, "space", function() Awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    Awful.key({ Modkey, "Control" }, "n",
        function()
            local c = Awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "restore minimized", group = "client" }),

    -- Prompt
    Awful.key({ Modkey }, "r", function() Awful.screen.focused().mypromptbox:run() end,
        { description = "run prompt", group = "launcher" }),

    Awful.key({ Modkey }, "x",
        function()
            Awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = Awful.screen.focused().mypromptbox.widget,
                exe_callback = Awful.util.eval,
                history_path = Awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description = "lua execute prompt", group = "awesome" }),
    -- Menubar
    Awful.key({ Modkey }, "d", function() Menubar.show() end,
        { description = "show the menubar", group = "launcher" })
)
