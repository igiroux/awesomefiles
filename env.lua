--[[

  Environment variables

  Part of Awesome WM config
  by Serghei Iakovlev (sadhooklay@gmail.com)
  https://github.com/sergeyklay

]]

__dir__         = awful.util.getdir('config')
lang            = os.getenv('LANG') or 'en_US.UTF-8'
terminal        = "urxvtc"
editor          = os.getenv("EDITOR") or "vim"
editor_cmd      = terminal .. " -e " .. editor
browser         = "firefox"
calculator      = "speedcrunch"
filebrowser     = "pcmanfm"
screensaver     = "xscreensaver-command -activate"
modkey          = "Mod4"

os.setlocale(os.getenv(lang))

-- vim:ft=lua:ts=8:sw=2:sts=2:tw=80:fenc=utf-8:et
