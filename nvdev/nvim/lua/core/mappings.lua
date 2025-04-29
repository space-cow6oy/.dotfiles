-- Leader --------------------------------------------------------------------------------
vim.g.mapleader = " "

-- Source --------------------------------------------------------------------------------
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- Jumping --------------------------------------------------------------------------------
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "J", "<C-d>")
vim.keymap.set("n", "K", "<C-u>")
vim.keymap.set("n", "<leader>h", "K")

-- Insert --------------------------------------------------------------------------------
vim.keymap.set("i", "jj", "<Esc>")
-- vim.keymap.set("n", "p", "a<C-S>v>")

-- Russian -------------------------------------------------------------------------------
local cmd = vim.cmd
cmd("set keymap=russian-jcukenwin")
cmd("set iminsert=0")
cmd("set imsearch=0")
cmd("highlight lCursor guifg=NONE guibg=Cyan")
vim.keymap.set("i", "rr", "<C-^>")

-- Errors -----------------------------------------------------------------------------
vim.keymap.set("n", "<leader>mh", ":lua vim.diagnostic.open_float()<CR>", { desc = "Error float" })
-- RESIZING ------------------------------------------------------------------------------
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- LazyGit ------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>lg", "<cmd>term<CR>ilazygit<CR>")
