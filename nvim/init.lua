vim.wo.number = true
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.scrolloff = 4
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_set_option_value("colorcolumn", "81", {})
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.autocomplete = true

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
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "kj", "<C-\\><C-n>")
vim.api.nvim_set_keymap("i", "<M-j>", "<C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<C-p>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-h>", "<C-e>", { noremap = true, silent = true })


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
