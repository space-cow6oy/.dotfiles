return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		}, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			heading = {
				backgrounds = {
					"RenderMarkdownH3Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH1Bg",
					"RenderMarkdownH1Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
				foregrounds = {
					"RenderMarkdownH1",
					"DiagnosticError",
					"DiagnosticError",
					"DiagnosticError",
					"RenderMarkdownH5",
					"RenderMarkdownH6",
				},
				icons = { "" },
				sign = false,
				border = true,
				border_virtual = true,
				position = "inline",
				width = "block",
				left_margin = 0.5,
				left_pad = 0.5,
				right_pad = 0.5,
			},
			code = {
				sign = false,
				width = "block",
				min_width = 45,
				right_pad = 2,
			},
		},
	},
}
