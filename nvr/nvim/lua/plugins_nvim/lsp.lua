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

      lspconfig.tailwindcss.setup({
        root_dir = require("lspconfig").util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.ts"
          -- content: ["./src/**/*.{js,ts,jsx,tsx,html}"]; -- должгл быть в tailwind.config.js
        ),
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({})
      lspconfig.html.setup({
        filetypes = { "html", "css", "eruby", "erb", "javascriptreact", "typescriptreact", "vue" },
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({})
      lspconfig.ruby_lsp.setup({})
      lspconfig.emmet_language_server.setup({
        filetypes = { "html", "css", "eruby", "erb", "javascriptreact", "typescriptreact", "vue" },
        capabilities = capabilities,
      })
    end,
  },
}
