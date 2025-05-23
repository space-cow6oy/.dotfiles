return {
  {
    -- There are ensure install for formatters somewhere
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          jsx = { "prettier", "prettierd" },
          json = { "prettier", "prettierd" },
          javascript = { "prettier", "prettierd" },
          javascriptreact = { "prettier", "prettierd" },
          css = { "prettier", "prettierd" },
          html = { "prettier", "prettierd" },
          ruby = { "rubocop" },
          -- erb = {" "}
        },
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
