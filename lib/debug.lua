--[[

  Debug helper

  Part of Awesome WM config
  by Serghei Iakovlev (sadhooklay@gmail.com)
  https://github.com/sergeyklay
]]

local tostring = tostring
local naughty = require("naughty")

module("lib.debug")

-- shortcut for naughty.notify
function alert(msg)
  naughty.notify {
    title = 'Alert!',
    text = tostring(msg),
  }
end

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=78:fenc=utf-8:et
