vim.api.nvim_create_user_command("RunCode", function()
  local scratch_buffer = vim.api.nvim_create_buf(false, true)
  local dir = tostring(vim.fn.getcwd())

  -- vim.bo[scratch_buffer].filetype = 'vim'
  local messages = vim.fn.jobstart({ "python3", string.format("%s/main.py", dir) }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.api.nvim_buf_set_text(scratch_buffer, 0, 0, 0, 0, data)
      end
    end,
    on_stderr = function(_, data)
      if data then
        vim.api.nvim_buf_set_text(scratch_buffer, 0, 0, 0, 0, data)
      end
    end,
  })

  vim.cmd("vertical sbuffer " .. scratch_buffer)
  vim.opt_local.wrap = true
  vim.bo.buflisted = false
  vim.bo.bufhidden = "wipe"
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = scratch_buffer })
end, {})

vim.api.nvim_set_keymap("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = true })
