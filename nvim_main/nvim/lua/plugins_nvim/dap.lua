return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap-python",
    },

    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()

      require("nvim-dap-virtual-text").setup({})
      -- Этот конфиг брал отсюда - ищешь по слову python
      -- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
      dap.adapters.python = {
        type = "executable",
        -- command = "/home/artem/.local/share/nvim/mason/packages/debugpy/venv/bin/python3",
        args = { "-m", "debugpy.adapter" },
      }

      vim.keymap.set("n", "<leader>os", dap.continue)
      vim.keymap.set("n", "<leader>ob", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>oo", dap.step_into)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap",
    },
    config = function()
      function get_python_path()
        -- Check if there's an active virtual environment
        local venv_path = os.getenv("VIRTUAL_ENV")
        if venv_path then
          return venv_path .. "/bin/python3"
        else
          return "/usr/bin/python3"
        end
      end

      local path = get_python_path()
      require("dap-python").setup(path)
      require("dap-python").setup()
    end,
  },
}
