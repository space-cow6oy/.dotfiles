return {
	{
		"3rd/diagram.nvim",
		dependencies = {
			"3rd/image.nvim",
		},
		config = function()
			require("diagram").setup({ -- you can just pass {}, defaults below
				-- integrations = {
				-- 	require("diagram.integrations.markdown"),
				-- 	require("diagram.integrations.neorg"),
				-- },
				renderer_options = {
					mermaid = {
						background = "transparent", -- nil | "transparent" | "white" | "#hex"
						theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
						scale = 2, -- nil | 1 (default) | 2  | 3 | ...
					},
					-- plantuml = {
					-- 	charset = nil,
					-- },
					-- d2 = {
					-- 	theme_id = nil,
					-- 	dark_theme_id = nil,
					-- 	scale = nil,
					-- 	layout = nil,
					-- 	sketch = nil,
					-- },
				},
			})
		end,
	},
}
