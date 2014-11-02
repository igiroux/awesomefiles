--[[

  Wigtes library

  Part of Awesome WM config
  by Serghei Iakovlev (sadhooklay@gmail.com)
  https://github.com/sergeyklay

]]

local wibox  = require 'wibox'
local oclock = require 'obvious.clock'

module('lib.widgets')

-- Separator separator for panels
function separator()
  local sep = wibox.widget.textbox()
  sep:set_markup('<span foreground="#333333"> | </span>')

  return sep
end

-- Clock Widget
function clock()
  oclock.set_editor('urxvtc -e vim')
  oclock.set_shortformat('%H:%M')
  oclock.set_longformat(function() return '%a %b %d %T' end)
  oclock.set_shorttimer(1)

  return oclock()
end

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=78:fenc=utf-8:et
