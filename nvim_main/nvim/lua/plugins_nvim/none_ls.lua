return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    -- DOCS
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.djlint.with({
          filetypes = { "html", "django", "jinja.html", "htmldjango" },
        }),
      },
    })
  end,
}
