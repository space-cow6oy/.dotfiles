local function unix_find_files()
  -- Запрашиваем у пользователя строку для поиска
  vim.ui.input({ prompt = "Unix Find: " }, function(input)
    if not input or input == "" then return end

    -- Формируем команду unix find с исключением папок node_modules, .git и dist
    -- Ищем совпадение по части имени (case-insensitive -iname)
    local cmd = {
      "find", ".",
      "-type", "d", "(", "-name", ".git", "-o", "-name", "node_modules", "-o",  "-name", "venv", "-o", "-name", "dist", ")", "-prune",
      "-o", "-type", "f", "-iname", "*" .. input .. "*", "-print"
    }

    -- Запускаем Unix-процесс асинхронно
    vim.system(cmd, { text = true }, vim.schedule_wrap(function(obj)
      if obj.code ~= 0 or not obj.stdout or obj.stdout == "" then
        print("Файлы не найдены или произошла ошибка")
        return
      end

      -- Разбиваем вывод find на строки (список файлов)
      local files = {}
      for file in string.gmatch(obj.stdout, "[^\r\n]+") do
        table.insert(files, file)
      end

      -- Если нашли только один файл — открываем его сразу
      if #files == 1 then
        vim.cmd("edit " .. vim.fn.fnameescape(files[1]))
        return
      end

      -- Если файлов много — показываем красивое интерактивное меню прямо в Neovim
      vim.ui.select(files, {
        prompt = "Найдено несколько файлов. Выберите нужный:",
      }, function(choice)
        if choice then
          vim.cmd("edit " .. vim.fn.escape(choice, " "))
        end
      end)
    end))
  end)
end

-- Привязываем функцию на удобную горячую клавишу (например, Space + f)
vim.keymap.set('n', "<leader>f", unix_find_files, {silent=true})
