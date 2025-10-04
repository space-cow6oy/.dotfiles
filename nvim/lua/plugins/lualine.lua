return {
  {
    "nvim-lualine/lualine.nvim",
	enabled=false,
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local custom_fname = require("lualine.components.filename"):extend()
      local highlight = require("lualine.highlight")
      local default_status_colors = { saved = nil, modified = "#cc241d" }

      function custom_fname:init(options)
        custom_fname.super.init(self, options)
        self.status_colors = {
          saved = highlight.create_component_highlight_group(
            { bg = default_status_colors.saved },
            "filename_status_saved",
            self.options
          ),
          modified = highlight.create_component_highlight_group(
            { bg = default_status_colors.modified },
            "filename_status_modified",
            self.options
          ),
        }
        if self.options.color == nil then
          self.options.color = ""
        end
      end

      function custom_fname:update_status()
        local data = custom_fname.super.update_status(self)
        data = highlight.component_format_highlight(
          vim.bo.modified and self.status_colors.modified or self.status_colors.saved
        ) .. data
        return data
      end
      require("lualine").setup({

        options = {
          globalstatus = true,
          theme = 	require("/my/line_theme").theme(),
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },

        sections = {
          lualine_a = {
            "branch",
          },
          lualine_b = {
            -- "filename",
            custom_fname,
            {
              "diagnostics",
            },
            "diff",
          },
          lualine_c = {
          },
          lualine_x = {},
          lualine_y = {
            function()
              return os.date("%H:%M %a %d %b")
            end,
          },
          lualine_z = { "location" }, -- "location"
        },
      })
    end,
  },
}
