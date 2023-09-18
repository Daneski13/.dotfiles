-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}
config = wezterm.config_builder()

-- Config
config.font = wezterm.font("FiraCode Nerd Font")
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

-- Keys
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.keys = {
    { key = "r", mods = "CMD", action = wezterm.action.SendKey { key = "r", mods = "CTRL" } },
    { key = "s", mods = "CMD", action = wezterm.action.SendKey { key = "s", mods = "CTRL" } },
}

return config
