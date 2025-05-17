return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {},
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>m", group = "TROUBLE" }, -- group
				{ "<leader>l", group = "LEETCODE" }, -- group
				{ "g", group = "GO TO" }, -- group
				{ "<leader>s", group = "LSP" }, -- group
				{ "<leader>g", group = "GIT" }, -- group
			})
			wk.setup({ preset = "helix" })
		end,
	},
}
