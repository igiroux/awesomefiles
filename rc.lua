--[[

  Awesome WM config
  by Serghei Iakovlev (sadhooklay@gmail.com)
  https://github.com/sergeyklay

]]

-- Libraries
awful           = require 'awful'
awful.rules     = require 'awful.rules'
awful.autofocus = require 'awful.autofocus'
beautiful       = require 'beautiful'
dedug           = require 'lib.debug'
naughty         = require 'naughty'

-- Open system files and execute their contents as Lua chunks
dofile(awful.util.getdir('config') .. '/env.lua')
dofile(__dir__ .. "/config/errors.lua")
dofile(__dir__ .. "/config/theme.lua")
dofile(__dir__ .. "/config/layouts.lua")
dofile(__dir__ .. "/config/tags.lua")
dofile(__dir__ .. "/config/menu.lua")
dofile(__dir__ .. "/config/bindings.lua")
dofile(__dir__ .. "/config/wiboxes.lua")
dofile(__dir__ .. "/config/rules.lua")
dofile(__dir__ .. "/config/signals.lua")

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=80:fenc=utf-8:et
