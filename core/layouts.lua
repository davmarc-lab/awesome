-- Layout definitions

require("core.common")

-- Table of layouts to cover with awful.layout.inc, order matters.
Awful.layout.layouts = {
    Awful.layout.suit.tile,
    Awful.layout.suit.tile.left,
    Awful.layout.suit.tile.bottom,
    Awful.layout.suit.tile.top,
    Awful.layout.suit.fair,
    Awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    Awful.layout.suit.magnifier,
    Awful.layout.suit.corner.nw,
    Awful.layout.suit.floating,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
