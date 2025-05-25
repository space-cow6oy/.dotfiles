return {
	"kiyoon/jupynium.nvim",
	build = "pip3 install --user .",

	config = function()
		-- function get_python_path()
		-- 	local venv_path = os.getenv("VIRTUAL_ENV")
		-- 	if venv_path then
		-- 		return venv_path .. "/bin/python3"
		-- 	else
		-- 		return "/usr/bin/python3"
		-- 	end
		-- end
		require("jupynium").setup({
			-- python_host = get_python_path(),
			auto_close_tab = false,
			-- notebook_dir = vim.fn.getcwd() .. "/notebooks/",
		})
	end,
}
