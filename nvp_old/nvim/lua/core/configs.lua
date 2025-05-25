-- Line Nnumbers
vim.wo.number = true
vim.wo.relativenumber = false

-- Endcoding
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Scroll
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Ruler
vim.api.nvim_set_option_value("colorcolumn", "91", {})

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

vim.diagnostic.config({
	virtual_text = false,
	-- signs = {
	-- 	linehl = {
	-- 		[vim.diagnostic.severity.ERROR] = "DiagnosticErrorLn",
	-- 		[vim.diagnostic.severity.WARN] = "DiagnosticWarnLn",
	-- 		[vim.diagnostic.severity.INFO] = "DiagnosticInfoLn",
	-- 		[vim.diagnostic.severity.HINT] = "DiagnosticHintLn",
	-- 	},
	-- },
})

vim.o.exrc = true
