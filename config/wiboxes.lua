--[[

  Wiboxes config

  Part of Awesome WM config
  by Serghei Iakovlev (sadhooklay@gmail.com)
  https://github.com/sergeyklay

]]

local obvious = {
  wlan         = require 'obvious.wlan',
  volume_alsa  = require 'obvious.volume_alsa',
  battery      = require 'obvious.battery',
  cpu          = require 'obvious.cpu',
  mem          = require 'obvious.mem'
}

local wibox = require 'wibox'

local lib = {
  widget  = require 'lib.widgets',
  battery = require 'lib.battery'
}

local wiboxes = {
  top    = {},
  bottom = {}
}

promptbox = {}
local layoutbox = {}

taglist   = {}
taglist.buttons = awful.util.table.join(
    awful.button({        }, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({        }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({        }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
    awful.button({        }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
)

tasklist  = {}
tasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else
    -- Without this, the following
    -- :isvisible() makes no sense
      c.minimized = false
      if not c:isvisible() then
          awful.tag.viewonly(c:tags()[1])
      end
      -- This will also un-minimize
      -- the client, if needed
      client.focus = c
      c:raise()
    end
  end),

  awful.button({ }, 3, function ()
    if instance then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients({ width=250 })
    end
  end),

  awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),

  awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end)
)

for s = 1, screen.count() do
  -- Create a promptbox for each screen
  promptbox[s] = awful.widget.prompt()
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  layoutbox[s] = awful.widget.layoutbox(s)
  layoutbox[s]:buttons(awful.util.table.join(
                         awful.button({ }, 1, function () awful.layout.inc(1, mouse.screen, layouts) end),
                         awful.button({ }, 3, function () awful.layout.inc(-1, mouse.screen, layouts) end),
                         awful.button({ }, 4, function () awful.layout.inc(1, mouse.screen, layouts) end),
                         awful.button({ }, 5, function () awful.layout.inc(-1, mouse.screen, layouts) end)))
  -- Create a taglist widget
  taglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist.buttons)

  -- Create a tasklist widget
  tasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist.buttons)

  -- Create the wiboxes
  wiboxes.top[s]    = awful.wibox({ position = "top", height="15", screen = s })
  wiboxes.bottom[s] = awful.wibox({ position = 'bottom', height='15', screen = s })

  -- Widgets that are aligned to the left
  local top_left = wibox.layout.fixed.horizontal()
  top_left:add(launcher)
  top_left:add(taglist[s])
  top_left:add(promptbox[s])

  -- Widgets that are aligned to the right
  local top_right = wibox.layout.fixed.horizontal()
  if s == 1 then
    top_right:add(wibox.widget.systray())
  end
  top_right:add(lib.widget.separator())
  top_right:add(lib.widget.clock())
  top_right:add(lib.widget.separator())
  -- determine device with: iw dev
  top_right:add(obvious.wlan('wlp4s0').widget)
  top_right:add(lib.widget.separator())
  top_right:add(obvious.volume_alsa())
  top_right:add(lib.widget.separator())
  if lib.battery.has_battery() then
    top_right:add(obvious.battery())
    top_right:add(lib.widget.separator())
  end
  top_right:add(layoutbox[s])

  -- Widgets that are aligned to the bottom right
  local bottom_right = wibox.layout.fixed.horizontal()
  bottom_right:add(lib.widget.separator())
  bottom_right:add(
    obvious.mem()
    :set_type("textbox")
    :set_format("mem: %3d%%")
    .widget
  )
  bottom_right:add(lib.widget.separator())
  bottom_right:add(
    obvious.cpu()
    :set_type("textbox")
    :set_format("cpu: %3d%%")
    .widget
  )

  -- Now bring it all together (with the tasklist in the middle)
  local top = wibox.layout.align.horizontal()
  top:set_left(top_left)
  top:set_middle(tasklist[s])
  top:set_right(top_right)

  local bottom = wibox.layout.align.horizontal()
  bottom:set_right(bottom_right)

  wiboxes.top[s]:set_widget(top)
  wiboxes.bottom[s]:set_widget(bottom)

end

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=80:fenc=utf-8:et
