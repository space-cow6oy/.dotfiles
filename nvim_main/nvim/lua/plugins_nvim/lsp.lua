return {
  {
    "neovim/nvim-lspconfig",
    enabled = false,
    config = function()
      local lspconfig = require("lspconfig")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
        end,
      })

      lspconfig.lua_ls.setup({})
    end,
  },
}
