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
  headers["Accept"] = "application/json"
  headers["RqUID"] = os.getenv("GIGA_RQUID")
  headers["Authorization"] = string.format("Basic %s", os.getenv("GIGA_AUTH_KEY"))
  print(vim.inspect(headers))
  -- payload for request
  local payload = { headers = headers, data = scope }

  -- making request
  local response = curl.post(request_url, payload)

  print(vim.inspect(response))
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
