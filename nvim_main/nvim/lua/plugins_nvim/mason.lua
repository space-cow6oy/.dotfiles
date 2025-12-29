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
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ty", "marksman" },
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({
        automatic_setup = true,
        ensure_installed = { "debugpy" },
        -- Handlers can automatically set up the adapter configuration
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      })
    end,
  },
}
