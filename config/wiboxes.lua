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

top_wiboxes = {}
promptbox   = {}
layoutbox   = {}

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

  -- Create the top wibox
  top_wiboxes[s] = awful.wibox({ position = "top", height="15", screen = s })

  -- Widgets that are aligned to the left
  local left_layout = wibox.layout.fixed.horizontal()
  left_layout:add(launcher)
  left_layout:add(taglist[s])
  left_layout:add(promptbox[s])

  -- Widgets that are aligned to the right
  local right_layout = wibox.layout.fixed.horizontal()
  if s == 1 then right_layout:add(wibox.widget.systray()) end
  right_layout:add(lib.widget.separator())
  right_layout:add(lib.widget.clock())
  right_layout:add(lib.widget.separator())
  right_layout:add(obvious.mem():set_type("textbox"):set_format("mem: %3d%%").widget)
  right_layout:add(lib.widget.separator())
  right_layout:add(obvious.cpu():set_type("textbox"):set_format("cpu: %3d%%").widget)
  right_layout:add(lib.widget.separator())
  -- determine device with: iw dev
  right_layout:add(obvious.wlan('wlp4s0').widget)
  right_layout:add(lib.widget.separator())
  right_layout:add(obvious.volume_alsa())
  right_layout:add(lib.widget.separator())
  if lib.battery.has_battery() then
    right_layout:add(obvious.battery())
    right_layout:add(lib.widget.separator())
  end
  right_layout:add(layoutbox[s])

  -- Now bring it all together (with the tasklist in the middle)
  local layout = wibox.layout.align.horizontal()
  layout:set_left(left_layout)
  layout:set_middle(tasklist[s])
  layout:set_right(right_layout)

  top_wiboxes[s]:set_widget(layout)

end

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=80:fenc=utf-8:et
