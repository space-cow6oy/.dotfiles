return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "javascript",
          "python",
          "markdown",
          "markdown_inline",
          "html",
          "css",
          "htmldjango",
        },
      })
    end,
  },
}
