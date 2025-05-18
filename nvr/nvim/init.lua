-- Basic Config
require("core.configs")
require("core.mappings")
require("core.lazy")
require("core.matcher")
require("core.messages")
require("core_nvim.mappings")
require("core_nvim.configs")

-- Gruvbox
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local accesskey = require("my.accesskey")
local get_new_access_key = accesskey.get_new_access_key

vim.g.get_new_access_key = get_new_access_key
