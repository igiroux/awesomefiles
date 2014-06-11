--[[

  Battery helper

  Part of Awesome WM config
  by Sergey Yakovlev (me@klay.me)
  https://github.com/sergeyklay

  For systems with installed acpi
]]

local io = { popen = io.popen }
local string = { match  = string.match }

module("lib.battery")

local found_battery

function has_battery()

  if found_battery == nil then
    local pipe = io.popen('acpi')
    local output = pipe:read '*a'
    pipe:close()

    found_battery = not not string.match(output, '^Battery 0') -- force true/false
  end

  return found_battery
end

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=80:fenc=utf-8:et
