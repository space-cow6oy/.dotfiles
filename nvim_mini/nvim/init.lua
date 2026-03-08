vim.wo.number = true
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.scrolloff = 4
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_set_option_value("colorcolumn", "80", {})
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.autocomplete = true
vim.opt.ignorecase = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.signcolumn="yes:1"

-- RUSSIAN
local cmd = vim.cmd
cmd("set keymap=russian-jcukenwin")
cmd("set iminsert=0")
cmd("set imsearch=0")
cmd("highlight lCursor guifg=NONE guibg=Cyan")
vim.keymap.set("i", "kk", "<C-^>")

vim.g.mapleader = " "
vim.keymap.set("i", "kj", "<C-c>")
vim.keymap.set({ "v", "n" }, "J", "<C-d>")
vim.keymap.set({ "v", "n" }, "K", "<C-u>")
vim.keymap.set({ "v", "n" }, "H", "^")
vim.keymap.set({ "v", "n" }, "L", "$")
vim.keymap.set({ "v"}, "L", "$h")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "kj", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>cc", ":cclose<CR>")
vim.keymap.set("n", "<leader>co", ":copen<CR>")
vim.api.nvim_set_keymap("i", "<M-j>", "<C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<C-p>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-h>", "<C-e>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-l>", "<C-y>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-space>", "<C-x><C-o>", { noremap = true, silent = true })


-- wildmenu
vim.opt.wildmenu = true
vim.opt.wim="noselect:lastused,longest"
vim.o.wop="pum,tagfile"
vim.o.wildignorecase = true
vim.o.wildignore = "**/node_modules/**"
vim.keymap.set("n","<leader>b", ":b <Tab>")
vim.o.pumborder = "rounded"
vim.opt.winborder="rounded"
-- this makes remap tab in command line possible
vim.o.wildcharm=9
-- path for find all files recursively
vim.opt.path=".,**"
vim.keymap.set("n","<leader>f", ":find <Tab>")

vim.api.nvim_set_keymap("c", "<M-j>", "<C-n>" , {})
vim.api.nvim_set_keymap("c", "<M-h>", "<C-c>", {})
vim.api.nvim_set_keymap("c", "<M-k>", "<C-p>", {})
vim.api.nvim_set_keymap("c", "<M-l>", "<Cr>", {})
-- vim.api.nvim_set_keymap("c", "<M-l>", "<C-y>", {})

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

vim.cmd [[set completeopt+=menuone,noselect,popup]]

 vim.api.nvim_create_autocmd("Filetype", {
 	pattern = { "*.html", "shtml", "htm" },
 	callback = function()
 		vim.lsp.start({
 			name = "superhtml",
 			cmd = { "superhtml", "lsp" },
 			root_dir = vim.fs.dirname(vim.fs.find({".git"}, { upward = true })[1])
 		})
 	end
 })

-- TREESITTER
vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})
treesitter = require("nvim-treesitter")
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



-- AUTOPAIRS
vim.pack.add({"https://github.com/windwp/nvim-autopairs"})
autopairs = require("nvim-autopairs")
autopairs.setup()

-- SPIDER
vim.pack.add({"https://github.com/chrisgrieser/nvim-spider"})
spider = require("spider")
spider.setup()

vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")

-- TABOUT
vim.pack.add({"https://github.com/kawre/neotab.nvim"})
tabout = require("neotab")
tabout.setup({
	  event = "InsertEnter",
    opts = {
        -- configuration goes here
    },
}
)

-- MINI ICONS
vim.pack.add({"https://github.com/nvim-mini/mini.icons"})
icons = require("mini.icons")
icons.setup()

-- MINI FILES
vim.pack.add({"https://github.com/nvim-mini/mini.files"})
files = require("mini.files")
files.setup({
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    options = {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      -- use_as_default_explorer = false,
    },
  },
})

vim.keymap.set("n", "<leader>-", ":lua MiniFiles.open()<CR>")

vim.keymap.set("n", "-", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end)


-- GRUVBOX
vim.cmd([[colorscheme retrobox]])
-- vim.pack.add({"https://github.com/ellisonleao/gruvbox.nvim"})
-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = { "*" },
--   callback = function()
-- 	  vim.cmd("hi SignColumn guibg=NONE")
-- 	  vim.cmd("hi DiagnosticSignWarn guifg=YELLOW guibg=NONE")
-- 	  vim.cmd("hi DiagnosticSignInfo guifg=GREEN guibg=NONE")
-- 	  vim.cmd("hi DiagnosticSignHint guifg=GREEN guibg=NONE")
-- 	  vim.cmd("hi DiagnosticSignError guifg=RED guibg=NONE")
-- 	  vim.cmd("hi DiagnosticError guifg=RED guibg=NONE")
--   end,
-- })
