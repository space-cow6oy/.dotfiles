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
vim.keymap.set("i", "rr", "<C-^>")

-- Errors -----------------------------------------------------------------------------
vim.keymap.set("n", "<leader>mh", ":lua vim.diagnostic.open_float()<CR>", { desc = "Error float" })
-- RESIZING ------------------------------------------------------------------------------
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Terminal ------------------------------------------------------------------------------
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

local job_id = 0
vim.keymap.set("n", "<leader>lg", function()
  vim.fn.chansend(job_id, { "lazygit\r\n" })
end)
-- LazyGit ------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>lg", "<cmd>term<CR>ilazygit<CR>")

-- Comments -----------------------------------------------------------------------------
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

-- Explorer ------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>e", "<cmd>Le<CR>")

vim.keymap.set(
  "n",
  "<leader>rr",
  "<Cmd>lua vim.g.get_new_access_key()<CR><Cmd>cq<CR>",
  { noremap = true, silent = true }
)

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
