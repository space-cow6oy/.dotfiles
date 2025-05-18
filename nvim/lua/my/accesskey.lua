-- https://developers.sber.ru/docs/ru/gigachat/certificates
-- чтобы иметь доступ к чат апи нужно установить сертификаты минцифр
local M = {}

local curl = require("plenary.curl")

function M.get_new_access_key()
  -- URL, по которому делаем запрос
  local request_url = "https://ngw.devices.sberbank.ru:9443/api/v2/oauth"

  -- data for request
  local scope = {}
  scope["scope"] = "GIGACHAT_API_PERS"
  -- headers
  local headers = {}
  headers["Content-Type"] = "application/x-www-form-urlencoded"
  headers["Accept"] = "atplication/json"
  headers["RqUID"] = os.getenv("GIGA_RQUID")
  headers["Authorization"] = string.format("Basic %s", os.getenv("GIGA_AUTH_KEY"))

  -- payload for request
  local payload = { headers = headers, data = scope }

  -- making request
  local response = curl.post(request_url, payload)
  -- request parsing
  local parsed_response = vim.fn.json_decode(response.body)

  print(parsed_response.access_token)

  if parsed_response.access_token then
    local access_token = parsed_response.access_token
    -- Opens a file specified by fileName in write mode
    file = io.open("/home/artem/.gigarc", "w")
    file:write(string.format("export GIGACHAT_API_KEY=%s", access_token))
    file:close()
  end
end
return M

--     local wezterm = io.open("/home/artem/.dotfiles/.wezterm.lua", "r")
--     local wezterm_temp = io.open("/home/artem/.wezterm_temp.lua", "w")
--     if wezterm then
--       for line in wezterm:lines() do
--         if line == "config.font_size = 16.5" then
--           wezterm_temp:write("config.font_size = 16.55\n")
--         elseif line == "config.font_size = 16.55" then
--           wezterm_temp:write("config.font_size = 16.5\n")
--         else
--           wezterm_temp:write(line .. "\n")
--         end
--       end
--       wezterm:close()
--       wezterm_temp:close()
--     else
--       print("NO WEZTERM FILE")
--     end
--
--     wezterm_temp = io.open("/home/artem/.wezterm_temp.lua", "r")
--     wezterm = io.open("/home/artem/.dotfiles/.wezterm.lua", "w")
--
--     if wezterm_temp then
--       -- Читаем весь файл целиком
--       local content = wezterm_temp:read("*a")
--
--       -- Закрываем исходный файл
--       wezterm_temp:close()
--
--       if wezterm then
--         -- Записываем прочитанное содержимое в выходной файл
--         wezterm:write(content)
--
--         -- Закрываем целевой файл
--         wezterm:close()
--
--         print("Данные успешно скопированы ")
--       else
--         print("Ошибка при открытии выходного файла.")
--       end
--     else
--       print("Ошибка при открытии входного файла.")
--     end
--   end
-- end
-- Команды Neovim для вызова плагина
-- vim.api.nvim_create_user_command("GetAuthKey", get_new_access_key, {})
-- vim.api.nvim_create_user_command("GigaUpdateEnv", update_env, {})

-- Автовызов при открытии файла определенного типа (при желании)
-- vim.cmd([[autocmd BufRead *.lua GetAuthKey]])

--- Всплывающее окно для ввода Access Key
-- vim.ui.input({ prompt = "Enter RqUID_access_key" }, function(input_value)
--   if input_value == nil then
--     print("Access Key was canceled")
--     return
--   end

-- split string from imput to RqUID and auth_key
-- RqUID_auth_key_table = {}
-- for word in input_value:gmatch("%S+") do
--   table.insert(RqUID_auth_key_table, word)
-- end

-- local RqUID = RqUID_auth_key_table[1]
-- local auth_key = RqUID_auth_key_table[2]
--
-- function update_env()
--
--   local codecompanion = io.open("/home/artem/.dotfiles/nvdev/nvim/lua/plugins/codecompanion.lua", "r")
--   local codecompanion_temp = io.open("/home/artem/codecompanion_temp.lua", "w")
--   if codecompanion then
--     for line in codecompanion:lines() do
--       if line == "giga = function()" then
--         codecompanion_temp:write("gigas = function()\n")
--       elseif line == 'adapter = "giga"' then
--         codecompanion_temp:write('adapter = "gigas"\n')
--       elseif line == "gigas = function()" then
--         codecompanion_temp:write("giga = function()\n")
--       elseif line == 'adapter = "gigas"' then
--         codecompanion_temp:write('adapter = "giga"\n')
--       else
--         codecompanion_temp:write(line .. "\n")
--       end
--     end
--     codecompanion:close()
--     codecompanion_temp:close()
--   else
--     print("NO codecompanion FILE")
--   end
--
--   codecompanion = io.open("/home/artem/.dotfiles/nvdev/nvim/lua/plugins/codecompanion.lua", "w")
--   codecompanion_temp = io.open("/home/artem/codecompanion_temp.lua", "r")
--
--   if codecompanion_temp then
--     -- Читаем весь файл целиком
--     local content = codecompanion_temp:read("*a")
--
--     -- Закрываем исходный файл
--     codecompanion_temp:close()
--
--     if codecompanion then
--       -- Записываем прочитанное содержимое в выходной файл
--       codecompanion:write(content)
--
--       -- Закрываем целевой файл
--       codecompanion:close()
--
--       print("Данные успешно скопированы ")
--     else
--       print("Ошибка при открытии выходного файла.")
--     end
--   else
--     print("Ошибка при открытии входного файла.")
--   end
--
--   vim.cmd("Lazy reload codecompanion.nvim")
--   -- vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
--   vim.cmd("so $MYVIMRC")
--
--   local env_key = os.getenv("GIGACHAT_API_KEY")
--   if env_key == access_token then
--     print("Auth Key successfully retrieved and stored as environment variable.")
--   else
--     print(string.format("ERROR: ACCESS TOKEN %s \nAND ENV_KEY ARE DIFFERENT %s", access_token, env_key))
--   end
--   print("Request failed with status:", response.body)
-- end
