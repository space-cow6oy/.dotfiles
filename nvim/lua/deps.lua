-- MASON
vim.pack.add({"https://github.com/mason-org/mason.nvim"})
mason = require("mason")
mason.setup({
  ensure_installed = {
	"lus_ls",
	"ruff",
	"marksman",
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
		  "tsgo"
        }
})


-- LSP
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
vim.lsp.enable({
  "stylua",
  "lua_ls",
  "pylsp",
  "marksman",
  "ruff",
  "emmet_language_server",
  "tailwindcss",
  "tsgo"
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

-- AUTOTAG
vim.pack.add({"https://github.com/windwp/nvim-ts-autotag"})
autotag = require("nvim-ts-autotag")
autotag.setup({
	 opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  }
)
-- DISABLE tailwind colors highlight in jsx files
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    -- Disable document colors
    vim.lsp.document_color.enable(false, { bufnr = ev.buf })
  end,
})
