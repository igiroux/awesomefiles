--[[

  Theme handling

  Part of Awesome WM config
  by Sergey Yakovlev (me@klay.me)
  https://github.com/sergeyklay

]]

local gears   = require("gears")
local naughty = require("naughty")

-- Define colours, icons, and wallpapers
beautiful.init(__dir__ .. "/themes/copyburn/theme.lua")


-- Wallpaper
if beautiful.wallpaper then
  for s = 1, screen.count() do
    gears.wallpaper.maximized(beautiful.wallpaper, s, true)
  end
end

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=80:fenc=utf-8:et