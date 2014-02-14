--------------------------------------------------------------------------------
-- @author Sergey Yakovlev &lt;me@klay.me&gt;
-- @copyright 2014 Sergey Yakovelev
-- @release v1.0.2
--------------------------------------------------------------------------------

--- Copyburn Theme
--
-- Based on:
-- "Dust"        by @tdy            https://github.com/tdy
-- "Copland"     by @copycat-killer https://github.com/copycat-killer
-- "Sweet Tears" by @bluezd         https://github.com/bluezd

-- {{{ Main
theme                                           = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/copyburn"
theme.wallpaper                                 = theme.dir .. "/wall.jpg"
-- }}}

-- {{{ Fonts
theme.font                                      = "Tamsyn 10.5"
theme.taglist_font                              = "Clear Sans 11"
-- }}}

-- {{{ Colors
theme.fg_normal                                 = "#bbbbbb"
theme.fg_focus                                  = "#ffffff"
theme.fg_urgent                                 = "#000000"
theme.bg_normal                                 = "#111111"
theme.bg_focus                                  = "#262b36"
theme.bg_urgent                                 = "#FFFFFF"
theme.bg_systray                                = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width                              = 1
theme.border_normal                             = "#141414"
theme.border_focus                              = "#FCFCFC"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_normal                        = "#191919"
theme.titlebar_bg_focus                         = "#262626"
--theme.titlebar_normal
--theme.titlebar_focus
-- }}}

-- {{{ Widgets
--theme.fg_widget
--theme.fg_center_widget
--theme.fg_end_widget
--theme.bg_widget
--theme.border_widget
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_timeout                       = 3
theme.mouse_finder_animate_timeout               = 0.05
theme.mouse_finder_radius                        = 20
theme.mouse_finder_factor                        = 2
theme.mouse_finder_color                         = "#ff0000"
-- }}}


-- {{{ Tooltips
--theme.tooltip_font
--theme.tooltip_opacity
--theme.tooltip_fg_color
--theme.tooltip_bg_color
--theme.tooltip_border_width
--theme.tooltip_border_color
-- }}}

-- {{{ Taglist
theme.taglist_fg_focus                          = "#6cb8e4"
theme.taglist_fg_urgent                         = "#e46c6c"
theme.taglist_fg_normal                         = "#ffffff"
theme.taglist_bg_focus                          = "#111111"
theme.taglist_bg_urgent                         = "#111111"
theme.taglist_bg_normal                         = "#111111"
-- }}}

-- {{{ Menu
--theme.menu_bg_normal
--theme.menu_bg_focus
--theme.menu_fg_normal
--theme.menu_fg_focus
--theme.menu_border_width
--theme.menu_border_color
theme.menu_height                               = 15
theme.menu_width                                = 100
-- }}}

-- {{{ Tasklist
theme.tasklist_sticky                           = ""
theme.tasklist_ontop                            = ""
theme.tasklist_floating                         = ""
theme.tasklist_maximized_horizontal             = ""
theme.tasklist_maximized_vertical               = ""
theme.tasklist_disable_icon                     = true
--theme.tasklist_bg_focus
--theme.tasklist_bg_urgent
--theme.tasklist_fg_focus
--theme.tasklist_fg_urgent
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel                       = theme.dir .. "/icons/taglist/squaref.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/taglist/square.png"
theme.taglist_squares_resize                    = false
-- }}}

-- {{{ Misc
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
-- }}}

-- {{{ Layout
theme.layout_fairh                              = theme.dir .. "/icons/layout/fairh.png"
theme.layout_fairv                              = theme.dir .. "/icons/layout/fairv.png"
theme.layout_floating                           = theme.dir .. "/icons/layout/floating.png"
theme.layout_magnifier                          = theme.dir .. "/icons/layout/magnifier.png"
theme.layout_max                                = theme.dir .. "/icons/layout/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/layout/fullscreen.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/layout/tilebottom.png"
theme.layout_tileleft                           = theme.dir .. "/icons/layout/tileleft.png"
theme.layout_tile                               = theme.dir .. "/iconslayout/tile.png"
theme.layout_tiletop                            = theme.dir .. "/icons/layout/tiletop.png"
theme.layout_spiral                             = theme.dir .. "/icons/layout/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/layou/dwindle.png"
-- }}}

theme.cpu                                       = theme.dir .. "/icons/cpu.png"
theme.ram                                       = theme.dir .. "/icons/ram.png"
theme.pac                                       = theme.dir .. "/icons/pac.png"
theme.mail                                      = theme.dir .. "/icons/mail.png"
theme.mpd                                       = theme.dir .. "/icons/mpd.png"
theme.batt                                      = theme.dir .. "/icons/batt.png"
theme.vol                                       = theme.dir .. "/icons/vol.png"
theme.net_up                                    = theme.dir .. "/icons/up.png"
theme.net_down                                  = theme.dir .. "/icons/down.png"

-- {{{ Titlebar
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

theme.useless_gap_width                         = 10

return theme

-- vim:ts=8:sw=2:sts=2:tw=80:et