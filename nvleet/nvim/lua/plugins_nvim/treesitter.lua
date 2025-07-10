return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "lua", "javascript", "ruby", "python" },
        sync_install = false,
        auto_install = false,
        ignore_install = {},
        modules = {},
      })
    end,
  },
}
