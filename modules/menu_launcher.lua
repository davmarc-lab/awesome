-- Create a launcher widget and a main menu

local menu = require("modules.menu")

MLauncher = Awful.widget.launcher({
    image = Beautiful.awesome_icon,
    menu = menu
})

-- Menubar configuration
Menubar.utils.Terminal = Terminal -- Set the terminal for applications that require it

return MLauncher
