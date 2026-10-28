vim.api.nvim_set_keymap("i", "<M-j>", "<C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<C-p>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-h>", "<C-e>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-l>", "<C-y>", { noremap = true, silent = true })


vim.api.nvim_set_keymap("c", "<M-j>", "<C-n>" , {})
vim.api.nvim_set_keymap("c", "<M-h>", "<C-c>", {})
vim.api.nvim_set_keymap("c", "<M-k>", "<C-p>", {})
vim.api.nvim_set_keymap("c", "<M-l>", "<Cr>", {})
-- vim.api.nvim_set_keymap("c", "<M-l>", "<C-y>", {})
