-- MINI FILES
vim.pack.add({"https://github.com/nvim-mini/mini.files"})
files = require("mini.files")
files.setup(
  {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
  options = {
    -- Whether to delete permanently or move into module-specific trash
    permanent_delete = false,
    -- Whether to use for editing directories
    use_as_default_explorer = true,
  },
})

vim.keymap.set("n", "<leader>-", ":lua MiniFiles.open()<CR>")

vim.keymap.set("n", "-", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end)

vim.api.nvim_create_user_command('MF', function(opts)
  -- Получаем полный абсолютный путь из аргумента команды
  local path = vim.fn.fnamemodify(opts.args, ':p')
  
  -- Устанавливаем фокус mini.files на выбранный путь
  require('mini.files').set_branch({path})
end, {
  -- Магия автодополнения: заставляем Neovim использовать всплывающие подсказки файлов
  complete = 'file', 
  -- Команда принимает ровно один аргумент (путь)
  nargs = 1,         
})
