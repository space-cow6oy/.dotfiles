return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        opts = {
          ensure_installed = {
            "lus_ls",
            "ruff",
            "marksman",
            "djlsp",
            "cssls",
            "djlsp",
            "emmet_language_server",
            "html",
            "lua_ls",
            "pylsp",
            "ruff",
            "stylelint_lsp",
            "stylua",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "marksman",
          "pylsp",
          "ruff",
          "tailwindcss",
          "emmet_language_server",
          "cssls",
          "html",
          "djlsp",
        },
      })
    end,
  },
}
