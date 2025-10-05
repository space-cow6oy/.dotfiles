return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup({
        opts = {
          ensure_installed = {
            "lus_ls",
            "pyright",
            "ruff",
            -- "rubyfmt",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },-- , "ruby_lsp"
      })
    end,
  },
}
