return {
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "tailwind-tools",
      "onsails/lspkind-nvim",
      -- ...
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
      cmp.setup({
        formatting = {
          format = require("lspkind").cmp_format({
            before = require("tailwind-tools.cmp").lspkind_format,
          }),
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<a-h>"] = cmp.mapping.abort(),
          ["<a-l>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<a-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<a-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            -- keyword_length = 1,
            -- max_item_count = 10,
            options = {
              ignore_server_names = { "html" }, -- Add more servers to exclude
            },
          },
        }, {
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }, {

          { name = "nvim_lsp_signature_help" },
        }, {

          { name = "path" },
          { name = "render-markdown" },
        }),
      })
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      -- vim.lsp.config("lua_ls", {
      --   capabilities = capabilities,
      -- })
      -- vim.lsp.enable("lua_ls")
      -- require("lspconfig")["lua_ls"].setup({
      --   capabilities = capabilities,
      -- })
    end,
  },
}
