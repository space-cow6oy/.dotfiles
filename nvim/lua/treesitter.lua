-- TREESITTER
vim.pack.add(
	{{
		src="https://github.com/nvim-treesitter/nvim-treesitter",
		version = 'main'
	}	}
)
treesitter = require("nvim-treesitter")
-- строку ниже нужно запустить один раз, чтобы он не устанавливал 
-- при каждом запуске
treesitter.install({
          "lua",
          "javascript",
          "python",
          "markdown",
          "markdown_inline",
          "html",
          "css",
          "htmldjango",
			"tsx"
      })

vim.pack.add {
  { src = "https://github.com/romus204/tree-sitter-manager.nvim" }
}

require("tree-sitter-manager").setup()



vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*.py", "*.lua", "*.html", "*.md", "*.js", "*.jsx" },
  callback = function() vim.treesitter.start() end,
})


