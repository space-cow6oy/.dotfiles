return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    -- DOCS
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.pydoclint.with({
          extra_args = { "--style=google", "--check-return-types=False", "--arg-type-hints-in-signature=False" },
        }),
        null_ls.builtins.code_actions.refactoring,
        -- null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.pylint,
        -- PYLINT IMPORT ERROR FIX
        -- https://vi.stackexchange.com/questions/45737/pylint-unable-to-find-imports-from-currently-active-virtual-environment
        -- https://blog.algarvio.me/blog/pylint-virtualenv/
        -- https://github.com/serranomorante/.dotfiles/commit/819b97c99c2559f4bf55f846e409b82d74871207#diff-b5a46edc1f3b4c78c02bfa49a3b5c914adbe75c69c528a89b0e86d16e4f1a3afR29
        -- https://github.com/serranomorante/.dotfiles/blob/main/docs/python-dev-setup.md
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
