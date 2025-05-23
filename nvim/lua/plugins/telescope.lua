return {
  "nvim-telescope/telescope.nvim",
  -- branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  config = function()
    -- FOCUS PREVIEW -----------------------------------------------------------------
    -- Function for tab between results and preview
    local focus_preview = function(prompt_bufnr)
      local action_state = require("telescope.actions.state")
      local picker = action_state.get_current_picker(prompt_bufnr)
      local prompt_win = picker.prompt_win
      local previewer = picker.previewer
      local winid = previewer.state.winid
      local bufnr = previewer.state.bufnr
      vim.keymap.set("n", "<Tab>", function()
        vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
      end, { buffer = bufnr })
      vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
      -- api.nvim_set_current_win(winid)
    end
    -- ------------- -----------------------------------------------------------------
    local default_mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
        ["dd"] = require("telescope.actions").delete_buffer,
        ["<Tab>"] = focus_preview,
      },
    }
    -- local book = {
    -- 	version = true,
    -- 	wrap_results = true,
    -- 	layout_strategy = "horizontal",
    -- 	layout_config = {
    -- 		horizontal = { width = 0.99, height = 0.9 },
    -- 		preview_width = 92,
    -- 	},
    -- 	mappings = default_mappings,
    -- }

    local desktop = {
      file_ignore_patterns = {
        "node_modules",
        "venv",
        "%.webp",
      },
      wrap_results = true,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.6,
        vertical = {
          height = 0.99,
          preview_cutoff = 0,
          prompt_position = "bottom",
          width = 0.99,
        },
      },
      mappings = default_mappings,
    }

    local current_defaults = desktop

    -- NOTE: FIND --------------------------------------------------------------------
    local builtin = require("telescope.builtin")
    -- local actions = require("telescope.actions")
    vim.keymap.set("n", "<leader>t", function()
      builtin.find_files()
    end, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>b", function()
      builtin.buffers({
        sort_mru = true,
        sort_lastuesed = true,
        initial_mode = "normal",
      })
    end, { desc = "Telescope buffers" })
    -- vim.keymap.set(
    -- 	"n",
    -- 	"<leader>th",
    -- 	builtin.help_tags,
    -- 	{ desc = "Telescope help tags" }
    -- )
    -- ------------- -----------------------------------------------------------------
    -- NOTE: LSP ---------------------------------------------------------------------
    vim.keymap.set("n", "gf", builtin.lsp_references, { desc = "LSP references" })
    vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "LSP implementation" })
    vim.keymap.set("n", "gd", function()
      require("telescope.builtin").lsp_definitions({
        jump_type = "never",
        initial_mode = "normal",
      })
    end, { desc = "LSP definitions" })
    -- vim.keymap.set(
    -- 	"n",
    -- 	"<leader>tp", builtin.lsp_type_definitions,
    -- 	{ desc = "LSP type defenitions" }
    -- )
    -- ------------- -----------------------------------------------------------------
    -- NOTE: Diagnostics -------------------------------------------------------------
    vim.keymap.set("n", "<leader>mm", function()
      require("telescope.builtin").diagnostics({
        wrap_results = true,
        root_dir = true,
        -- {root_dir}            (string|boolean)  if set to string, get
        --                                         diagnostics only for buffers
        --                                         under this dir otherwise cwd
        line_width = "full",
        layout_config = {
          -- vertical = { width = 92, height = 50 },
          preview_height = 0.6,
        },
        initial_mode = "normal",
      })
    end, { desc = "Diagnostics" })
    vim.keymap.set("n", "<leader>mb", function()
      require("telescope.builtin").diagnostics({
        bufnr = 0,
        wrap_results = true,
        line_width = "full",
        layout_config = {
          -- vertical = { width = 92, height = 50 },
          preview_height = 0.6,
        },
        initial_mode = "normal",
      })
    end, { desc = "Diagnostics Buffer" })
    vim.keymap.set("n", "<leader>mq", function()
      require("telescope.builtin").quickfix({
        bfnr = 0,
        wrap_results = true,
        line_width = "full",
        layout_config = {
          vertical = { width = 92, height = 50 },
          preview_height = 0.6,
        },
        initial_mode = "normal",
      })
    end, { desc = "QuickFix" })
    -- ------------- -----------------------------------------------------------------
    -- NOTE: Defaults ----------------------------------------------------------------
    require("telescope").setup({
      defaults = current_defaults,
    })
    -- ------------- -----------------------------------------------------------------
  end,
}
