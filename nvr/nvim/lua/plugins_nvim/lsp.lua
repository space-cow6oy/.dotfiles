return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
          vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Action" })
        end,
      })

      lspconfig.lua_ls.setup({})
      lspconfig.ruby_lsp.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.css_variables.setup({})
      lspconfig.cssmodules_ls.setup({})
      lspconfig.emmet_language_server.setup({
        filetypes = { "html", "css", "eruby", "erb", "javascriptreact", "typescriptreact", "vue" },
        capabilities = capabilities,
      })
    end,
  },
}
