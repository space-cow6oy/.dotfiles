return {
  "nvimtools/none-ls.nvim",
  config = function()
    null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- null_ls.builtins.formatting.erb_format,
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.diagnostics.mypy,
        -- null_ls.builtins.diagnostics.ruff,
      },
    })
  end,
}
