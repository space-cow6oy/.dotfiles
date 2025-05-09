local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.font_size = 16.55

-- config.font = wezterm.font("MesloLGS NF")
config.font = wezterm.font("JetBrains Mono")

config.max_fps = 120
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.enable_kitty_graphics = true
config.window_background_opacity = 0.95
config.color_scheme = "GruvboxDarkHard"
-- config.font_size = 14

-- Leader is the same as my old tmux prefix
-- config.leader = { key = "", mods = "CTRL", timeout_milliseconds = 1000 }
-- config.keys = {
-- 	-- splitting
-- 	{
-- 		mods = "LEADER",
-- 		key = "-",
-- 		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "=",
-- 		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		key = "r",
-- 		mods = "LEADER",
-- 		action = wezterm.action.ReloadConfiguration,
-- 	},
-- }

return config
