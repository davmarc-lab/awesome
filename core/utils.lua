-- Utils function

require("core.common")

function set_wallpaper(s)
    -- Wallpaper
    if Beautiful.wallpaper then
        local wallpaper = Beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        Gears.wallpaper.maximized(wallpaper, s, true)
    end
end
