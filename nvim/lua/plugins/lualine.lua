return {
	{
		"nvim-lualine/lualine.nvim",
		-- "mfussenegger/nvim-lint",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
					theme = "gruvbox",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = {},
					lualine_y = {
						-- function()
						-- 	local linters = require("lint").get_running()
						-- 	if #linters == 0 then
						-- 		return "󰦕"
						-- 	end
						-- 	return "󱉶 " .. table.concat(linters, ", ")
						function()
							local buffers = vim.fn.execute("ls")
							local count = 0
							-- Match only lines that represent buffers, typically starting with a number followed by a space
							for line in string.gmatch(buffers, "[^\r\n]+") do
								if string.match(line, "^%s*%d+") then
									count = count + 1
								end
							end
							return count
						end, -- end,
					},
					lualine_z = { "location" },
				},
			})
		end,
	},
}
