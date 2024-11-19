-- Leader --------------------------------------------------------------------------------
vim.g.mapleader = " "

-- Insert --------------------------------------------------------------------------------
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "оо", "<ESC>")
-- vim.keymap.set("n", "p", "a<C-S>v>")

-- Russian -------------------------------------------------------------------------------
local cmd = vim.cmd
cmd("set keymap=russian-jcukenwin")
cmd("set iminsert=0")
cmd("set imsearch=0")
cmd("highlight lCursor guifg=NONE guibg=Cyan")
vim.keymap.set("i", "ll", "<C-^>")

-- Leetcode ------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>lc", "<cmd>Leet console<CR>", { desc = "Console" })
vim.keymap.set("n", "<leader>li", "<cmd>Leet info<CR>", { desc = "Info" })
vim.keymap.set("n", "<leader>lr", "<cmd>Leet test<CR>", { desc = "Run Tests" })
vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "Submit" })
vim.keymap.set("n", "<leader>lt", "<cmd>Leet tabs<CR>", { desc = "Tabs" })
vim.keymap.set("n", "<leader>ll", "<cmd>Leet list<CR>", { desc = "List of problems" })
vim.keymap.set(
	"n",
	"<leader>lq",
	"<cmd>Leet reset<CR>",
	{ desc = "Reset code to default" }
)
vim.keymap.set("n", "<leader>ld", "<cmd>Leet desc<CR>", { desc = "Toggle desc" })
vim.keymap.set("n", "<leader>lu", "<cmd>Leet update<CR>", { desc = "Update cookie" })

-- Errors -----------------------------------------------------------------------------
vim.keymap.set(
	"n",
	"<leader>mh",
	":lua vim.diagnostic.open_float()<CR>",
	{ desc = "Error float" }
)
