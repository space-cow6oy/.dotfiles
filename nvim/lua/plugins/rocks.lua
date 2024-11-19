return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
			hererocks = true,
		},
		config = function()
			require("luarocks-nvim").setup({})
		end,
	},
}
