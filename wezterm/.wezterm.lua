-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}
config = wezterm.config_builder()

-- Config
config.font = wezterm.font("Fira Code")
config.enable_scroll_bar = true
config.font_size = 15

local OS = os.getenv("OS") or io.popen("uname"):read("*l")
local alpha = 1
if OS == "Windows_NT" then
    alpha = 0
    config.win32_system_backdrop = "Acrylic"
elseif OS == "Darwin" then
    alpha = 0.9
    config.macos_window_background_blur = 26
elseif OS == "Linux" then
    alpha = 0.7
end
config.window_background_opacity = alpha

config.hide_tab_bar_if_only_one_tab = true

-- Colors
config.color_scheme_dirs = { '~/.config/werterm/colors' }
config.color_scheme = "Generated"

return config
