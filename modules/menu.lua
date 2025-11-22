-- Menu widget
require("core.common")

local myawesomemenu = {
    { "hotkeys",     function() Hotkeys_popup.show_help(nil, Awful.screen.focused()) end },
    { "manual",      Terminal .. " -e man awesome" },
    { "edit config", Editor_cmd .. " " .. awesome.conffile },
    { "restart",     awesome.restart },
    { "quit",        function() awesome.quit() end },
}

return Awful.menu({
    items = { { "awesome", myawesomemenu, Beautiful.awesome_icon },
        { "open terminal", Terminal }
    }
})
