-- Basic Config
require("core.configs")
require("core.mappings")
require("core.lazy")
require("core.status_line")

-- Gruvbox
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local accesskey = require("accesskey")
local get_new_access_key = accesskey.get_new_access_key

vim.g.get_new_access_key = get_new_access_key

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*", -- Применяется ко всем файлам
--   callback = function()
--     print("Gi")
--     vim.g.statusline()
--   end,
--   nested = true, -- каким то образом без этого флага после релоада вима в последнем буффере нет хайлайта синтаксиса
-- })
