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
vim.cmd([[colorscheme retrobox]])

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


vim.cmd [[set completeopt+=menuone,noselect,popup]]

-- Comments -------------------------------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Disable comment on new line
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = augroup("General", { clear = true }),
  desc = "Disable New Line Comment",
})

-- DEPS
-- require('deps')


-- MINI ICONS
vim.pack.add({"https://github.com/nvim-mini/mini.icons"})
icons = require("mini.icons")
icons.setup()

-- MINI FILES
vim.pack.add({"https://github.com/nvim-mini/mini.files"})
files = require("mini.files")
files.setup(
  {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
  options = {
    -- Whether to delete permanently or move into module-specific trash
    permanent_delete = false,
    -- Whether to use for editing directories
    use_as_default_explorer = true,
  },
})

vim.keymap.set("n", "<leader>-", ":lua MiniFiles.open()<CR>")

vim.keymap.set("n", "-", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end)

-- AUTOPAIRS
vim.pack.add({"https://github.com/windwp/nvim-autopairs"})
autopairs = require("nvim-autopairs")
autopairs.setup()

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

-- SPIDER
vim.pack.add({"https://github.com/chrisgrieser/nvim-spider"})
spider = require("spider")
spider.setup()

vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")

-- NEOGIT
vim.pack.add({"https://github.com/nvim-lua/plenary.nvim"})
vim.pack.add({"https://github.com/NeogitOrg/neogit"})
neogit = require("neogit")
neogit.setup()

-- Or via lua api
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
