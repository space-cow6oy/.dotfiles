return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    -- DOCS
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
    null_ls.setup({
      sources = {

        null_ls.builtins.diagnostics.pydoclint.with({
          extra_args = { "--style=google", "--check-return-types=False", "--arg-type-hints-in-signature=False" },
        }),
        null_ls.builtins.code_actions.refactoring,
        -- null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.djlint.with({

          filetypes = { "html", "django", "jinja.html", "htmldjango" },
          diagnostics_postprocess = function(diagnostic)
            -- Force the severity to be ERROR
            diagnostic.severity = vim.diagnostic.severity["ERROR"]
          end,
        }),
      },
    })
  end,
}
