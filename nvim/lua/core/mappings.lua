-- Leader --------------------------------------------------------------------------------
vim.g.mapleader = " "

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
vim.keymap.set("i", "ll", "<C-^>")

-- Errors -----------------------------------------------------------------------------
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { desc = "Error float" })
vim.keymap.set("n", "<leader>h", ":lua vim.lsp.buf.hover({border = 'rounded'})<CR>", { desc = "Error float" })

-- RESIZING ------------------------------------------------------------------------------
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Terminal ------------------------------------------------------------------------------
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- vim.keymap.set("t", "jj", "<C-\\><C-n>")
-- vim.keymap.set("t", "<C-c>", "<C-\\><C-n>")

-- LazyGit ------------------------------------------------------------------------------
-- local job_id = 0
-- vim.keymap.set("n", "<leader>lg", function()
--   vim.fn.chansend(job_id, { "lazygit\r\n" })
-- end)
vim.keymap.set("n", "<leader>lg", "<cmd>term<CR>ilazygit<CR>")

-- BUFFER
-- Переключение на предыдущий буфер
vim.api.nvim_set_keymap("n", "<leader><leader>", "<C-o>", { noremap = true, silent = true })

-- Explorer ------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>e", "<cmd>Le<CR>")

vim.keymap.set(
  "n",
  "<leader>rn",
  "<Cmd>lua vim.g.get_new_access_key()<CR><Cmd>cq<CR>",
  { noremap = true, silent = true }
)

-- MiniFiles
vim.keymap.set("n", "<leader>-", ":lua MiniFiles.open()<CR>")

vim.keymap.set("n", "-", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end)

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end)

-- Кусок кода, который позволяет ливать из вима через rr и сразу переоткрывать вим
-- #!~/bin/bash
--
-- while true; do
--     /usr/bin/nvim "$@"  # change path to real nvim binary as necessary
--     if [ $? -ne 1 ]; then
--         break
--     fi
-- done

-- HOP ------------------------------------------------------------------------------------
vim.keymap.set("n", "f", function()
  require("hop").hint_words()
end)
vim.keymap.set("v", "f", function()
  require("hop").hint_words()
end)
-- SPIDER ---------------------------------------------------------------------------------
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")

-- SIGNARUTRE -----------------------------------------------------------------------------
vim.keymap.set({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help({ border = "rounded" })
end, { silent = true, noremap = true, desc = "toggle signature" })
