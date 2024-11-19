return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				opts = {
					ensure_installed = { "lua_ls", "html", "pyright", "ruff", "mypy", "debugpy" },
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "html", "pyright" },
			})
		end,
	},
}
