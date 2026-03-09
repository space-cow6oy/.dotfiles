vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 4

vim.bo.filetype = 'python'
vim.bo.syntax = 'python'

local api = vim.api
local opts = {
  noremap = true,
  silent = false
}

-- Диагностика загрузки файла
-- vim.notify("Loading Python ftplugin...")

-- Проверяем тип файла
if vim.bo.filetype ~= 'python' then
  vim.notify("Current buffer is NOT a Python file.")
  return
end

-- Установка мапинга
api.nvim_buf_set_keymap(
  0,
  'n',
  '<leader>pi',
  ':compiler python<CR>:make<CR>',
  -- ':compiler python<CR>:silent! make | redraw!<CR>',
  opts
)

api.nvim_buf_set_keymap(
  0,
  'n',
  '<leader>pp',
  ':compiler python_cur<CR>:make<CR>',
  -- ':compiler python_cur<CR>:silent! make | redraw!<CR>',
  opts
)

api.nvim_buf_set_keymap(
  0,
  'n',
  '<leader>ph',
  ':compiler pylint<CR>:make<CR>',
  opts
)

api.nvim_buf_set_keymap(
  0,
  'n',
  '<leader>pw',
  ':compiler flake8<CR>:make<CR>',
  opts
)

