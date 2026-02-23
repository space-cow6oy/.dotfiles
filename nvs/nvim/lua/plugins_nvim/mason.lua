return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup({
        opts = {
          ensure_installed = {
            "lus_ls",
            "pyright",
			"marksman"
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "marksman" },
      })
    end,
  },
}
