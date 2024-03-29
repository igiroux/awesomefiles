--[[

  Keyboard and muse bindings

  Part of Awesome WM config
  by Serghei Iakovlev (sadhooklay@gmail.com)
  https://github.com/sergeyklay

]]

local mousefinder = require 'awful.mouse.finder'()
local volume      = require 'lib.volume'
local tonumber    = tonumber

local do_volume_notification
do
  local volume_icon_base = awful.util.getdir('config') .. '/icons/'
  local volume_notification

  do_volume_notification = function(args)
    if args.icon then
      args.icon = volume_icon_base .. args.icon
    end

    if volume_notification and volume_notification.box.visible then
      args.replaces_id = volume_notification.id
    end

    volume_notification = naughty.notify(args)
  end
end

local function louder()
    local volume = volume.increment()

    do_volume_notification {
      title = 'Volume Changed',
      text = tostring(volume) .. '%',
      icon = 'stock_volume-max.png',
      opacity = volume / 100,
    }
end


local function quieter()
    local volume = volume.decrement()

    do_volume_notification {
      title = 'Volume Changed',
      text = tostring(volume) .. '%',
      icon = 'stock_volume-min.png',
      opacity = volume / 100,
    }
end

local function togglemute()
    local state = volume.toggle()

    if state then
      do_volume_notification {
        title = 'Volume Changed',
        text = 'Muted',
        icon = 'stock_volume-mute.png'
      }
    else
      do_volume_notification {
        title = 'Volume Changed',
        text = 'Unmuted',
        icon = 'stock_volume-max.png'
      }
    end
end

-- Mouse bindings
root.buttons(awful.util.table.join(
  awful.button({                }, 3,        function () main_menu:toggle() end),
  awful.button({                }, 4,        awful.tag.viewnext),
  awful.button({                }, 5,        awful.tag.viewprev)
))

-- Key bindings
globalkeys = awful.util.table.join(
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

  awful.key({ modkey,           }, "j",
    function ()
      awful.client.focus.byidx( 1)
      if client.focus then client.focus:raise() end
    end),

  awful.key({ modkey,           }, "k",
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end),

  awful.key({ modkey,           }, "w",      function () main_menu:show() end),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j",      function () awful.client.swap.byidx(  1)    end),
  awful.key({ modkey, "Shift"   }, "k",      function () awful.client.swap.byidx( -1)    end),
  awful.key({ modkey, "Control" }, "j",      function () awful.screen.focus_relative( 1) end),
  awful.key({ modkey, "Control" }, "k",      function () awful.screen.focus_relative(-1) end),
  awful.key({ modkey,           }, "u",      awful.client.urgent.jumpto),
  awful.key({ modkey,           }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end),

  -- Mouse finder
  awful.key({ modkey,           }, "g" ,     function () mousefinder.find(mousefinder) end),

  -- Advanced Volume Control
  awful.key({                   }, "XF86AudioRaiseVolume", louder),
  awful.key({                   }, "XF86AudioLowerVolume", quieter),
  awful.key({                   }, "XF86AudioMute",        togglemute),

  -- Misc
  awful.key({                   }, "XF86HomePage",   function () awful.util.spawn(browser) end),
  awful.key({                   }, "XF86Calculator", function () awful.util.spawn(calculator) end),
  awful.key({                   }, "XF86MyComputer", function () awful.util.spawn(filebrowser) end),
  awful.key({                   }, "XF86MonBrightnessDown", function () awful.util.spawn('xbacklight -dec 10') end),
  awful.key({                   }, "XF86MonBrightnessUp",   function () awful.util.spawn('xbacklight -inc 10') end),

  -- Standard program
  awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
  awful.key({                   }, "Print",
    function ()
      awful.util.spawn_with_shell("scrot -e 'mv $f ~/media/pictures/screenshots/ 2>~/log/scrot'")
    end),
  awful.key({ modkey, "Control" }, "r",     awesome.restart),
  awful.key({ modkey, "Shift"   }, "q",     awesome.quit),

  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
  awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
  awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
  awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
  awful.key({ modkey, "Control" }, "n",     awful.client.restore),

  -- Prompt
  awful.key({ modkey            }, "r",     function () promptbox[mouse.screen]:run() end),
  awful.key({ modkey            }, "x",
    function ()
      awful.prompt.run({ prompt = "Run Lua code: " },
      promptbox[mouse.screen].widget,
      awful.util.eval, nil,
      awful.util.getdir("cache") .. "/history_eval")
    end),

  -- Menubar
  awful.key({ modkey            }, "p",     function() menubar.show() end)
)

clientkeys = awful.util.table.join(
  awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
  awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
  awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
  awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
  awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
  awful.key({ modkey,           }, "n",
    function (c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end),
  awful.key({ modkey,           }, "m",
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c.maximized_vertical   = not c.maximized_vertical
    end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
          awful.tag.viewonly(tag)
        end
      end),
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end),
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = awful.tag.gettags(client.focus.screen)[i]
          if tag then
            awful.client.movetotag(tag)
          end
        end
      end),
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = awful.tag.gettags(client.focus.screen)[i]
          if tag then
            wful.client.toggletag(tag)
          end
        end
      end))
end

clientbuttons = awful.util.table.join(
  awful.button({        }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=80:fenc=utf-8:et
