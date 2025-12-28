-- Basic Config
require("core.configs")
require("core.mappings")
require("core.lazy")
require("my.messages")

-- Gruvbox
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.lsp.enable({
  "stylua",
  "stylelint_lsp",
  "lua_ls",
  "pylsp",
  "marksman",
  "djlsp",
  "ruff",
  "cssls",
  "html",
  "emmet_language_server",
})

-- local accesskey = require("my.accesskey")
-- local get_new_access_key = accesskey.get_new_access_key

-- vim.g.get_new_access_key = get_new_access_key
