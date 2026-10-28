vim.api.nvim_set_keymap("i", "<A-j>", "<C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<C-p>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-h>", "<C-e>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-l>", "<C-y>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("c", "<A-j>", "<C-n>" , {})
vim.api.nvim_set_keymap("c", "<A-h>", "<C-c>", {})
vim.api.nvim_set_keymap("c", "<A-k>", "<C-p>", {})
vim.api.nvim_set_keymap("c", "<A-l>", "<Cr>", {})
-- vim.api.nvim_set_keymap("c", "<A-l>", "<C-y>", {})

