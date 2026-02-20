local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.font = wezterm.font("MesloLGS NF")
config.font = wezterm.font("JetBrains Mono")
-- фонты лежат в ~/local/share/fonts
config.font_size = 23

config.max_fps = 120
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.enable_kitty_graphics = true
config.window_background_opacity = 0.9
config.color_scheme = "GruvboxDarkHard"

config.term = "xterm-kitty"

return config
