require("core.common")

local mylauncher = require("modules.menu_launcher")
local mykeyboardlayout = Awful.widget.keyboardlayout()
local mytextclock = Wibox.widget.textclock()
local mymainmenu = require("modules.menu")

-- Create a wibox for each screen and add it
local taglist_buttons = Gears.table.join(
    Awful.button({}, 1, function(t) t:view_only() end),
    Awful.button({ Modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    Awful.button({}, 3, Awful.tag.viewtoggle),
    Awful.button({ Modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    Awful.button({}, 4, function(t) Awful.tag.viewnext(t.screen) end),
    Awful.button({}, 5, function(t) Awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = Gears.table.join(
    Awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end),
    Awful.button({}, 3, function()
        Awful.menu.client_list({ theme = { width = 250 } })
    end),
    Awful.button({}, 4, function()
        Awful.client.focus.byidx(1)
    end),
    Awful.button({}, 5, function()
        Awful.client.focus.byidx(-1)
    end))

Awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    Awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, Awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = Awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = Awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(Gears.table.join(
        Awful.button({}, 1, function() Awful.layout.inc(1) end),
        Awful.button({}, 3, function() Awful.layout.inc(-1) end),
        Awful.button({}, 4, function() Awful.layout.inc(1) end),
        Awful.button({}, 5, function() Awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = Awful.widget.taglist {
        screen  = s,
        filter  = Awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = Awful.widget.tasklist {
        screen  = s,
        filter  = Awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = Awful.wibar({ position = "top", screen = s })

    local volume = require("widgets.volume")

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = Wibox.layout.align.horizontal,
        { -- Left widgets
            layout = Wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        {             -- Right widgets
            layout = Wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            Wibox.widget.systray(),
            Wibox.widget({
                text = volume:get_volume(),
                widget = Wibox.widget.textbox
            }),
            mytextclock,
            s.mylayoutbox,
        },
    }
end)

root.buttons(Gears.table.join(
    Awful.button({}, 3, function() mymainmenu:toggle() end),
    Awful.button({}, 4, Awful.tag.viewnext),
    Awful.button({}, 5, Awful.tag.viewprev)
))
