-- matching_selection.lua

local api = vim.api

-- Функция поиска ближайшего парного символа
-- Функция поиска ближайшего парного символа
local function find_nearest_pair(char_list, position)
  local row, col = unpack(position)
  local line = vim.fn.getline(row)

  -- Таблица соответствия символов
  local reverse_map = {}
  for k, v in pairs(char_list) do
    reverse_map[v] = k
  end
  print(vim.inspect(line))

  -- Начальные позиции поиска
  local forward_pos = col - 1
  local backward_pos = col + 1

  -- Результаты поиска
  local first_found_char = nil
  local direction = nil -- 'left' или 'right'

  -- Параллельно ищем символ слева и справа
  while forward_pos <= #line and backward_pos >= 1 do
    -- Проверяем левую сторону
    if backward_pos >= 1 then
      local backward_char = line:sub(backward_pos, backward_pos)
      if char_list[backward_char] then
        first_found_char = backward_char
        direction = "left"
        break
      end
      backward_pos = backward_pos - 1
    end

    -- Проверяем правую сторону
    if forward_pos <= #line then
      local forward_char = line:sub(forward_pos, forward_pos)
      if reverse_map[forward_char] then
        first_found_char = forward_char
        direction = "right"
        break
      end
      forward_pos = forward_pos + 1
    end
  end

  -- Если ничего не нашли, возвращаем nil
  if not first_found_char then
    return nil
  end

  -- print("No matching pair found near cursor.")
  -- Находим соответствующий символ с противоположной стороны
  if direction == "left" then
    -- Открытый символ найден слева, ищем закрывающий справа
    forward_pos = col
    local depth = 0
    while forward_pos <= #line do
      local forward_char = line:sub(forward_pos, forward_pos)
      if forward_char == reverse_map[first_found_char] then
        depth = depth + 1
      elseif forward_char == char_list[first_found_char] then
        if depth == 0 then
          return first_found_char, forward_char
        else
          depth = depth - 1
        end
      end
      forward_pos = forward_pos + 1
    end
  else
    -- Закрытый символ найден справа, ищем открывающий слева
    backward_pos = col
    local depth = 0
    while backward_pos >= 1 do
      local backward_char = line:sub(backward_pos, backward_pos)
      if backward_char == reverse_map[first_found_char] then
        if depth == 0 then
          return backward_char, first_found_char
        else
          depth = depth - 1
        end
      elseif backward_char == first_found_char then
        depth = depth + 1
      end
      backward_pos = backward_pos - 1
    end
  end

  return nil
end

-- Функция выделения текста внутри парных символов
local function visual_inside_matching()
  -- Получаем позицию курсора
  local pos = api.nvim_win_get_cursor(0)

  -- Таблица соответствия символов
  local match_pairs = {
    ['"'] = '"',
    ["'"] = "'",
    ["["] = "]",
    ["{"] = "}",
    ["("] = ")",
    ["<"] = ">",
  }

  -- Находим ближайший парный символ
  local opening_char, closing_char = find_nearest_pair(match_pairs, pos)

  if opening_char then
    -- Выделяем текст внутри пары символов
    api.nvim_feedkeys(api.nvim_replace_termcodes("vi" .. opening_char, true, false, true), "n", true)
  else
    -- print("No matching pair found near cursor.")
  end
end

-- Функция выделения текста вокруг парных символов
local function visual_around_matching()
  -- Получаем позицию курсора
  local pos = api.nvim_win_get_cursor(0)

  -- Таблица соответствия символов
  local match_pairs = {
    ['"'] = '"',
    ["'"] = "'",
    ["["] = "]",
    ["{"] = "}",
    ["("] = ")",
    ["<"] = ">",
  }

  -- Находим ближайший парный символ
  local opening_char, closing_char = find_nearest_pair(match_pairs, pos)

  if opening_char then
    -- Выделяем текст вокруг пары символов
    api.nvim_feedkeys(api.nvim_replace_termcodes("va" .. opening_char, true, false, true), "n", true)
  else
    -- print("No matching pair found near cursor.")
  end
end

-- Регистрация команд для использования функций
vim.api.nvim_create_user_command("VisualInsideMatching", visual_inside_matching, {})
vim.api.nvim_create_user_command("VisualAroundMatching", visual_around_matching, {})

-- Пример маппингов для удобства
vim.api.nvim_set_keymap("n", "mi", "<Cmd>VisualInsideMatching<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ma", "<Cmd>VisualAroundMatching<CR>", { noremap = true, silent = true })
