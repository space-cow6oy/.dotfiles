-- GREP
-- Настройки парсинга вывода (оставляем, так как cgetexpr использует их)
vim.o.grepformat = "%f:%l:%c:%m"

vim.keymap.set("n", "<leader>g", function()
  -- 1. Запрашиваем текст у пользователя
  local search = vim.fn.input("Git Grep (literal) for: ")
  if search == "" then return end

  -- 2. Формируем чистую и безопасную команду для терминала
  -- Флаг -F отключает regex. Точка в конце железно запускает рекурсию в текущей папке.
local cmd = string.format("git grep -n --column -F --no-color --untracked %s .", vim.fn.shellescape(search))

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
