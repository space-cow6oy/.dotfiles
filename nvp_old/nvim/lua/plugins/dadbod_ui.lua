return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sql", "mysql", "plsql" },
			lazy = true,
		}, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_auto_execute_table_helpers = 0
		vim.g.db_ui_execute_on_save = 0
		vim.g.db_ui_save_location = vim.fn.getcwd() .. "/queries/"
	end,
}
