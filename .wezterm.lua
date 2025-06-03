local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.font = wezterm.font("MesloLGS NF")
config.font = wezterm.font("JetBrains Mono")
-- фонты лежат в ~/local/share/fonts
config.font_size = 16.50

config.max_fps = 120
config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.enable_kitty_graphics = true
config.window_background_opacity = 0.9
config.color_scheme = "GruvboxDarkHard"

-- I added a modified version of this in my zshrc file, so if the kitty terminfo
-- file is not present it will be downloaded and installed automatically
--
-- But if you want to manually download and install the kitty terminfo file
-- run the command below on your terminal:
-- tempfile=$(mktemp) && curl -o "$tempfile" https://raw.githubusercontent.com/kovidgoyal/kitty/master/terminfo/kitty.terminfo && tic -x -o ~/.terminfo "$tempfile" && rm "$tempfile"

config.term = "xterm-kitty"

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
