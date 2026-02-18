-- tailwind-tools.lua
return { -- tailwind-tools.lua
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {}, -- your configuration
}
