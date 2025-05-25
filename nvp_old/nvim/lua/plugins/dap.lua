return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap-python",
		},

		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()

			require("nvim-dap-virtual-text").setup({
				enabled = true, -- enable this plugin (the default)
				enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = false, -- only show virtual text at first definition (if there are multiple)
				all_references = true, -- show virtual text on all all references of the variable (not only definitions)
				clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
				--- A callback that determines how a variable is displayed or whether it should be omitted
				--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
				--- @param buf number
				--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
				--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
				--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
				--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
				display_callback = function(variable, buf, stackframe, node, options)
					-- by default, strip out new line characters
					if options.virt_text_pos == "inline" then
						return " = " .. variable.value:gsub("%s+", " ")
					else
						return variable.name .. " = " .. variable.value:gsub("%s+", " ")
					end
				end,
				-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
				virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

				-- experimental features:
				all_frames = true, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
				virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
				virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
				-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
			})
			-- NOTE: Этот конфиг брал отсюда - ищешь по слову python
			-- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
			dap.adapters.python = {
				type = "executable",
				-- command = "/home/artem/.local/share/nvim/mason/packages/debugpy/venv/bin/python3",
				args = { "-m", "debugpy.adapter" },
			}

			-- NOTE: Which KEY docs
			local wk = require("which-key")
			wk.add({
				{ "<leader>d", group = "DEBUGGER" }, -- group
				{ "<leader>ds", group = "step" }, -- group
				{
					"<leader>db",
					dap.toggle_breakpoint,
					desc = "toggle_breakpoint",
					mode = "n",
				},
				{
					"<leader>dt",
					dap.run_to_cursor,
					desc = "run_to_cursor",
					mode = "n",
				},
				{
					"<leader>dc",
					dap.continue,
					desc = "continue",
					mode = "n",
				},
				{
					"<leader>dsi",
					dap.step_into,
					desc = "step_into",
					mode = "n",
				},
				{
					"<leader>dst",
					dap.step_out,
					desc = "step_out",
					mode = "n",
				},
				{
					"<leader>dso",
					dap.step_over,
					desc = "step_over",
					mode = "n",
				},
				{
					"<leader>dsb",
					dap.step_back,
					desc = "step_back",
					mode = "n",
				},
				{
					"<leader>dr",
					dap.restart,
					desc = "restart",
					mode = "n",
				},
				{
					"<leader>dv",
					function()
						require("dapui").eval(nil, { enter = true })
					end,
					desc = "value under cursor",
					mode = "n",
				},
			})

			-- NOTE: MAPPINGS
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
			vim.keymap.set("n", "<leader>dt", dap.run_to_cursor)

			-- Eval var under cursor
			vim.keymap.set("n", "<leader>dv", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<leader>dc", dap.continue)
			vim.keymap.set("n", "<leader>dsi", dap.step_into)
			vim.keymap.set("n", "<leader>dso", dap.step_over)
			vim.keymap.set("n", "<leader>dst", dap.step_out)
			vim.keymap.set("n", "<leader>dsb", dap.step_back)
			vim.keymap.set("n", "<leader>dr", dap.restart)

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap",
		},
		config = function()
			-- function get_python_path()
			-- 	-- Check if there's an active virtual environment
			-- 	local venv_path = os.getenv("VIRTUAL_ENV")
			-- 	if venv_path then
			-- 		return venv_path .. "/bin/python3"
			-- 	else
			-- 		return "/usr/bin/python3"
			-- 	end
			-- end

			-- local path = get_python_path()
			-- require("dap-python").setup(path)
			require("dap-python").setup()
		end,
	},
}
