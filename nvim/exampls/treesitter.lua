local at_cursor = vim.treesitter.get_captures_at_cursor()
local text = vim.treesitter.get_node_text(vim.treesitter.get_node(),  vim.api.nvim_get_current_buf())
local type = vim.treesitter.get_node():type()
local text_dad = vim.treesitter.get_node_text(vim.treesitter.get_node():parent(),  vim.api.nvim_get_current_buf())
local type_dad = vim.treesitter.get_node():parent():type()
local text_grand_dad = vim.treesitter.get_node_text(vim.treesitter.get_node():parent():parent(),  vim.api.nvim_get_current_buf())
local type_grand_dad = vim.treesitter.get_node():parent():parent():type()

vim.print(at_cursor)
vim.print(text)
vim.print(type)
vim.print(text_dad)
vim.print(type_dad)
vim.print(split(text_dad, "."))

function foo()
	local b = "b"
end

local M = {}
M.bar = function()
	local b = "c"
end

