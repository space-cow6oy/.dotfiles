-- MASON
vim.pack.add({"https://github.com/mason-org/mason.nvim"})
mason = require("mason")
mason.setup({
  ensure_installed = {
	"lus_ls",
	"ruff",
	"marksman",
	"djlsp",
	"cssls",
	"djlsp",
	"emmet_language_server",
	"lua_ls",
	"pylsp",
	"ruff",
	"stylelint_lsp",
	"stylua",
  }
})

vim.pack.add({"https://github.com/mason-org/mason-lspconfig.nvim"})
mason_lsp = require("mason-lspconfig")
mason_lsp.setup({

        ensure_installed = {
          "lua_ls",
          "marksman",
          "pylsp",
          "ruff",
          "tailwindcss",
          "emmet_language_server",
          "djlsp",
        }
})


-- LSP
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
vim.lsp.enable({
  "stylua",
  "lua_ls",
  -- "stylelint_lsp",
  "pylsp",
  "marksman",
  "djlsp",
  "ruff",
  -- "cssls",
  "emmet_language_server",
  "tailwindcss",
  "superhtml"
})

vim.keymap.set({ "n" }, "gs", function()
  vim.lsp.buf.signature_help({ border = "rounded" })
end, { silent = true, noremap = true, desc = "toggle signature" })

vim.keymap.set("n", "<leader>h", function()
  vim.lsp.buf.hover({ border = "rounded" })
end, { noremap = true, silent = true })

vim.keymap.set("n", "gd", function()
  vim.lsp.buf.definition({ border = "rounded" })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { desc = "Error float" })

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

-- TREESITTER
vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})
treesitter = require("nvim-treesitter")
-- строку ниже нужно запустить один раз, чтобы он не устанавливал 
-- при каждом запуске
-- treesitter.install({
--           "lua",
--           "javascript",
--           "python",
--           "markdown",
--           "markdown_inline",
--           "html",
--           "css",
--           "htmldjango",
--       })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*.py", "*.lua", "*.html", "*.md" },
  callback = function() vim.treesitter.start() end,
})

-- AUTOTAG
vim.pack.add({"https://github.com/windwp/nvim-ts-autotag"})
autotag = require("nvim-ts-autotag")
autotag.setup({})


