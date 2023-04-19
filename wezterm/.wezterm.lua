-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}
config = wezterm.config_builder()

-- Config
config.font = wezterm.font("Fira Code")
config.enable_scroll_bar = true
config.font_size = 15
config.window_background_opacity = 0.9
config.macos_window_background_blur = 26
config.hide_tab_bar_if_only_one_tab = true

-- Colors
config.color_scheme_dirs = { '~/.config/werterm/colors' }
config.color_scheme = "Generated"

return config
