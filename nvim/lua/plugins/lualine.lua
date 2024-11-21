return {
	{
		"nvim-lualine/lualine.nvim",
		-- "mfussenegger/nvim-lint",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local custom_gruvbox = require("lualine.themes.gruvbox")

			-- Change the background of lualine_c section for normal mode
			custom_gruvbox.normal.a.bg = "#c9b085"
			custom_gruvbox.normal.b.bg = "#111115"
			custom_gruvbox.normal.c.bg = "#c9b085"

			custom_gruvbox.normal.a.fg = "#26231b"
			custom_gruvbox.normal.b.fg = "#c9b085"
			custom_gruvbox.normal.c.fg = "#26231b"

			custom_gruvbox.insert.a.bg = "#452303"
			custom_gruvbox.insert.b.bg = "#111111"
			custom_gruvbox.insert.c.bg = "#d4be98"

			custom_gruvbox.insert.a.fg = "#c9b085"
			custom_gruvbox.insert.b.fg = "#26231b"
			custom_gruvbox.insert.c.fg = "#26231b"

			custom_gruvbox.visual.b.fg = "#c9b085" -- git milky
			custom_gruvbox.command.b.fg = "#c9b085" -- git milky

			buffers = function()
				local buffers = vim.fn.execute("ls")
				local count = 0
				-- Match only lines that represent buffers, typically starting with a
				-- number followed by a space
				for line in string.gmatch(buffers, "[^\r\n]+") do
					if string.match(line, "^%s*%d+") then
						count = count + 1
					end
				end
				return count
			end
			require("lualine").setup({

				options = {
					globalstatus = true,
					theme = custom_gruvbox,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						"mode",
					},
					lualine_b = {

						"branch",
						{
							"diagnostics",
							diagnostics_color = {
								warn = { fg = "#8c6129" },
								info = { fg = "#5f824b" },
							},
						},
					},
					lualine_c = {},
					lualine_x = {

						buffers,
						"filename",
					},
					lualine_y = {
						"diff",
						function()
							return os.date("%H:%M %a %d %b")
						end,
					},
					lualine_z = {}, -- "location"
				},
			})
		end,
	},
}
