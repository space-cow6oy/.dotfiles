local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.font = wezterm.font("MesloLGS NF")
-- config.font = wezterm.font("JetBrains Mono")
-- фонты лежат в ~/local/share/fonts
config.font_size = 25

config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_background_opacity = 0.9
config.line_height = 1.2
-- config.color_scheme = "GruvboxDarkHard"

return config
