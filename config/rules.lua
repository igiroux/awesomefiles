--[[

  Rules setup

  Part of Awesome WM config
  by Serghei Iakovlev (sadhooklay@gmail.com)
  https://github.com/sergeyklay

]]

awful.rules.rules = {

  -- All clients will match this rule
  {
    rule       = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus        = awful.client.focus.filter,
      keys         = clientkeys,
      buttons      = clientbuttons
    }
  },

  {
    rule       = { class = "MPlayer" },
    properties = { floating = true }
  },

  {
    rule       = { class = "pinentry" },
    properties = { floating = true }
  },

  -- For Gimp with single windiw mode
  {
    rule       = { class = "gimp" },
    properties = { tag = tags[1][5] }
  },

  {
    rule       = { class = "Firefox" },
    properties = { tag = tags[1][2] }
  },

  {
    rule_any   = { class = { "Chromium", "Google-chrome-stable" } },
    properties = { tag = tags[1][2] }
  },

  {
    rule       = { class = "luakit" },
    properties = { tag = tags[1][2] }
  },

  {
    rule       = { class = "jetbrains-phpstorm" },
    properties = { tag = tags[1][6] }
  },

  {
    rule       = { class = "Subl3" },
    properties = { tag = tags[1][7] }
  },

  {
    rule_any   = { class = { "Psi-plus" } },
    except     = { instance = "main" },
    properties = { tag = tags[1][3] },
    callback   = awful.client.setslave
  },

  {
    rule       = { class = "Psi-plus", instance = "main" },
    properties = { tag = tags[1][3] }
  },

  {
    rule       = { class = "Thunderbird" },
    properties = { tag = tags[1][8] }
  },

  {
    rule       = { class = "Skype" },
    except     = { role = "ConversationsWindow" },
    properties = { tag = tags[1][4] },
    callback   = awful.client.setslave
  },

  {
    rule       = { class = "Speedcrunch" },
    properties = { floating = true, focus = true, width = 600, height = 600 }
  },

  -- Full screeen fix for Firefox video player
  {
    rule       = { instance = "plugin-container" },
    properties = {
      onfocus      = true,
      floating     = true,
      border_width = 0,
      ontop        = true,
      fullscreen   = true
    }
  }
}

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=78:fenc=utf-8:et
