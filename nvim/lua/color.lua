vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim"
})

require("gruvbox").setup({
italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
	  transparent_mode = false,
})

vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")
