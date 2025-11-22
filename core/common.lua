-- Standard awesome library
Gears = require("gears")
Awful = require("awful")
-- Widget and layout library
Wibox = require("wibox")
-- Theme handling library
Beautiful = require("beautiful")
-- Notification library
Naughty = require("naughty")
Menubar = require("menubar")
Hotkeys_popup = require("awful.hotkeys_popup")

Terminal = "kitty"
Editor = os.getenv("EDITOR") or "nano"
Editor_cmd = Terminal .. " -e " .. Editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
Modkey = "Mod4"
