--[[

  Definition of menu

  Part of Awesome WM config
  by Sergey Yakovlev (me@klay.me)
  https://github.com/sergeyklay

]]

local p = require("lib.power")
local menubar = require("menubar")

awesome_menu = {
  { "&Manual",  terminal .. " -e man awesome"         },
  { "&Config",  editor_cmd .. " " .. awesome.conffile },
  { "&Restart", awesome.restart                       },
  { "&Quit",    awesome.quit                          }
}

develop_menu = {
  { "&PhpStorm",       "/opt/phpstorm/bin/phpstorm.sh" },
  { "&Sublime Text 3", "subl3"                         },
  { "&Vim",            editor_cmd                      },
  { "&Robomongo",      robomongo                       }
}

www_menu = {
  { "&Chromium",     "chromium"         },
  { "&Firefox",      "firefox"          },
  { "&Thunderbird",  "thunderbird"      },
  { "&Psi+",         "psi-plus"         },
  { "&FileZilla",    "filezilla"        },
  { "&Skype",        "skype"            },
  { "&Transmission", "transmission-gtk" }
}

graphic_menu = {
  { "&Gimp",     "gimp" },
  { "G&PicView", "gpicview" }
}

power_menu = {
  { "&Lock Screen", p.screensaver },
  { "&Suspend",     p.suspend     },
  { "&Hibernate",   p.hibernate   },
  { "Sl&eep",       p.sleep       },
  { "&Reboot",      p.reboot      },
  { "&Power Off",   p.poweroff    }
}

media_menu = {
  { "&SMplayer",  "smplayer" }
}

system_menu = {
  { "&PCManFM",  "pcmanfm" }
}

-- Create a main menu
main_menu = awful.menu({
  items = {
    { "&Develop",  develop_menu },
    { "&Internet", www_menu     },
    { "&Graphic",  graphic_menu },
    { "&Media",    media_menu   },
    { "&System",   system_menu  },
    { "&Awesome",  awesome_menu },
    { "&Power",    power_menu   }
  },
  theme = { width = 150 }
})

-- Create a laucher widget
launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu  = main_menu
})

-- Set the terminal for applications that require it
menubar.utils.terminal = terminal

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=80:fenc=utf-8:et
