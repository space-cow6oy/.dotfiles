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

vim.opt.wildmenu = true
vim.opt.wim="noselect:lastused,full"
vim.keymap.set("n","<leader>b", ":b <Tab>")
vim.o.pumborder = "rounded"
vim.opt.winborder="rounded"
vim.o.wildcharm=9

