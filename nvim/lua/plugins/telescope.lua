return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	branch = "master",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- FOCUS PREVIEW -----------------------------------------------------------------

		local focus_preview = function(prompt_bufnr)
			local action_state = require("telescope.actions.state")
			local picker = action_state.get_current_picker(prompt_bufnr)
			local prompt_win = picker.prompt_win
			local previewer = picker.previewer
			local winid = previewer.state.winid
			local bufnr = previewer.state.bufnr
			vim.keymap.set("n", "<Tab>", function()
				vim.cmd(
					string.format(
						"noautocmd lua vim.api.nvim_set_current_win(%s)",
						prompt_win
					)
				)
			end, { buffer = bufnr })
			vim.cmd(
				string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid)
			)
			-- api.nvim_set_current_win(winid)
		end
		-- NOTE: Which KEY docs
		local wk = require("which-key")
		wk.add({
			{ "<leader>t", group = "TELESCOPE" }, -- group
		})
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		vim.keymap.set(
			"n",
			"<leader>tt",
			builtin.find_files,
			{ desc = "Telescope find files" }
		)
		vim.keymap.set(
			"n",
			"<leader>tg",
			builtin.live_grep,
			{ desc = "Telescope live grep" }
		)
		vim.keymap.set("n", "<leader>tb", function()
			builtin.buffers({
				sort_mru = true,
				sort_lastuesed = true,
				initial_mode = "normal",
			})
		end, { desc = "Telescope buffers" })
		vim.keymap.set(
			"n",
			"<leader>tn",
			"<cmd>Telescope notify<CR>",
			{ desc = "Notify" }
		)
		vim.keymap.set(
			"n",
			"<leader>th",
			builtin.help_tags,
			{ desc = "Telescope help tags" }
		)
		-- LSP ---------------------------------------------------------------------------
		vim.keymap.set(
			"n",
			"<leader>tr",
			builtin.lsp_references,
			{ desc = "LSP references" }
		)
		vim.keymap.set(
			"n",
			"<leader>ti",
			builtin.lsp_implementations,
			{ desc = "LSP implementation" }
		)
		vim.keymap.set("n", "<leader>td", function()
			require("telescope.builtin").lsp_definitions({
				jump_type = "never",
				initial_mode = "normal",
			})
		end, { desc = "LSP definitions" })
		vim.keymap.set(
			"n",
			"<leader>tp",
			builtin.lsp_type_definitions,
			{ desc = "LSP type defenitions" }
		)
		-- Diagnostics -------------------------------------------------------------------
		vim.keymap.set("n", "<leader>mm", function()
			require("telescope.builtin").diagnostics({
				wrap_results = true,
				line_width = "full",
				layout_config = {
					vertical = { width = 92, height = 50 },
					preview_height = 0.5,
				},
				initial_mode = "normal",
			})
		end, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>mb", function()
			require("telescope.builtin").diagnostics({
				bfnr = 0,
				wrap_results = true,
				line_width = "full",
				layout_config = {
					vertical = { width = 92, height = 50 },
					preview_height = 0.5,
				},
				initial_mode = "normal",
			})
		end, { desc = "Diagnostics Buffer" })
		require("telescope").setup({
			defaults = {
				version = true,
				wrap_results = true,
				layout_strategy = "vertical",
				layout_config = {
					vertical = { width = 92, height = 50 },
					preview_height = 0.7,
				},
				mappings = {
					n = {
						["q"] = require("telescope.actions").close,
						["dd"] = require("telescope.actions").delete_buffer,
						["<Tab>"] = focus_preview,
					},
				},
			},
		})
	end,
}
