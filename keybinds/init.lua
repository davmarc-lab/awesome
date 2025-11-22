require("core.common")

-- all awesome wm keybinds (not for clients)
local coreKeys = require("core.keybinds")
local wsKeys = require("keybinds.workspaces")
local playerKeys = require("keybinds.player")

local rootKeys = Gears.table.join(coreKeys, wsKeys, playerKeys)
root.keys(rootKeys)
