--Line Nnumbers
vim.wo.number = true
vim.wo.relativenumber = false
vim.opt.iskeyword = { "@", "_", "-", "." }
-- Endcoding
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true
-- Hide statusbar
-- vim.opt.laststatus = 0
-- Hide cmd line
-- vim.opt.ruler = false
-- vim.opt.showcmd = false
-- vim.opt.cmdheight = 0

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Scroll
vim.opt.scrolloff = 4
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Ruler
vim.api.nvim_set_option_value("colorcolumn", "121", {})

vim.api.nvim_del_augroup_by_id(vim.api.nvim_create_augroup("MarkdownHighlightGroup", {}))

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.api.nvim_set_option_value("colorcolumn", "81", {})
    vim.cmd("syn clear markdownError")
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.py", "*.lua" },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.api.nvim_set_option_value("colorcolumn", "81", {})
  end,
})

-- Markdown teruns off _ Highlight
-- :syn clear markdownError

-- Highlight current line
vim.opt.cursorline = true
-- Fillchars
vim.opt.fillchars = {
  vert = "│",
  fold = "⠀",
  eob = " ", -- suppress ~ at EndOfBuffer
  -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
} -- Disable virtual_text since it's redundant due to lsp_lines.

vim.o.exrc = true

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-terminal-open", { clear = true }),
  callback = function()
    vim.opt.number = false
  end,
})

-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- DIAGNOSTICS ------------------------------------------------------------------------
vim.diagnostic.config({
  float = { border = "rounded" },
  virtual_text = false,
  signs = true, -- иконки в левом канале
  underline = true, -- подчёркивание проблемных участков
})

-- Comments -----------------------------------------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Disable comment on new line
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = augroup("General", { clear = true }),
  desc = "Disable New Line Comment",
})
