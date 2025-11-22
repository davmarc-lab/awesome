require("core.common")

-- all awesome wm keybinds (not for clients)
local coreKeys = require("core.keybinds")
local wsKeys = require("keybinds.workspaces")

local rootKeys = Gears.table.join(coreKeys, wsKeys)
root.keys(rootKeys)
