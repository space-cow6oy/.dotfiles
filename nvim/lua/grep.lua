-- GREP
-- Настройки парсинга вывода (оставляем, так как cgetexpr использует их)
vim.o.grepformat = "%f:%l:%c:%m"
local excludes = {
  "package.json",
  "package-lock.json",
  "node_modules",
  "venv",
  ".venv",
  ".git", -- полезно добавить, чтобы не искать во внутренней кухне git
}

vim.keymap.set("n", "<leader>g", function()
  -- 1. Запрашиваем текст у пользователя
  local search = vim.fn.input("Git Grep (literal) for: ")
  if search == "" then return end

  -- 2. Автоматически превращаем список в строку вида: ':!package.json' ':!node_modules'
  local exclude_parts = {}
  for _, pattern in ipairs(excludes) do
    table.insert(exclude_parts, string.format("':!%s'", pattern))
  end
  local exclude_str = table.concat(exclude_parts, " ")

  -- 3. Формируем финальную команду терминала
  local cmd = string.format(
    "git grep -i -n --column -F --no-color --untracked %s -- . %s",
    vim.fn.shellescape(search),
    exclude_str
  )

  -- 3. Выполняем команду напрямую в системе (в обход встроенного :grep)
  local output = vim.fn.system(cmd)

  -- 4. Проверяем, нашел ли git grep хоть что-то
  if vim.v.shell_error ~= 0 and output == "" then
    vim.notify("Ничего не найдено", vim.log.levels.WARN)
    return
  end

  -- 5. Загружаем сырой текст из терминала напрямую в список quickfix
  vim.fn.setqflist({}, "r", {
    title = "Git Grep: " .. search,
    lines = vim.split(output, "\n", { trimempty = true })
  })

  -- 6. Открываем окно результатов
  vim.cmd("copen")
end, { desc = "Git Grep manual search (Robust recursion)" })
