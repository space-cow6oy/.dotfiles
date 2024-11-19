return {

	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		function get_python_path()
			-- Check if there's an active virtual environment
			local venv_path = os.getenv("VIRTUAL_ENV")
			if venv_path then
				return venv_path .. "/bin/python3"
			else
				return "/usr/bin/python3"
			end
		end

		-- Specify how the border looks like
		local border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		}

		-- Add the border on hover and on signature help
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(
				require("noice.lsp").hover(),
				{ border = border }
			),

			["textDocument/signatureHelp"] = vim.lsp.with(
				vim.lsp.handlers.signature_help,
				{ border = border }
			),
		}

		-- Add border to the diagnostic popup window
		vim.diagnostic.config({
			-- virtual_text = {
			-- 	prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
			-- },
			float = { border = border },
		})

		-- Add the border to the lua language server
		lspconfig.lua_ls.setup({
			handlers = handlers,
			-- The rest of the server configuration
		})

		-- Add the border to the pyright server
		lspconfig.pyright.setup({
			handlers = handlers,
			settings = {
				python = {
					pythonPath = get_python_path(),
				},
			},
		})
		-- Larichev's setup
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }
				vim.keymap.set(
					"n",
					"gd",
					vim.lsp.buf.definition,
					{ buffer = ev.buf, desc = "Go to Definition" }
				)
				vim.keymap.set("n", "<leader>h", function()
					require("noice.lsp").hover()
				end, { buffer = ev.buf, desc = "Hover" })
				vim.keymap.set(
					"n",
					"gi",
					vim.lsp.buf.implementation,
					{ buffer = ev.buf, desc = "Go to Implementation" }
				)
				vim.keymap.set(
					"n",
					"<leader>sh",
					vim.lsp.buf.signature_help,
					{ buffer = ev.buf, desc = "Signature_help" }
				)
				vim.keymap.set(
					"n",
					"gp",
					vim.lsp.buf.type_definition,
					{ buffer = ev.buf, desc = "Go to Type Definition" }
				)
				vim.keymap.set(
					"n",
					"<Leader>sr",
					vim.lsp.buf.rename,
					{ buffer = ev.buf, desc = "Rename Symbol" }
				)
				vim.keymap.set(
					{ "n", "v" },
					"<Leader>sa",
					vim.lsp.buf.code_action,
					{ buffer = ev.buf, desc = "Code Action" }
				)
				vim.keymap.set("n", "<Leader>sf", function()
					vim.lsp.buf.format({ async = true })
				end, { buffer = ev.buf, desc = "format" })
			end,
		})
	end,
}
