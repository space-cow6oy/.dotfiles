vim.api.nvim_create_user_command("CompileCode", function()
  local scratch_buffer = vim.api.nvim_create_buf(false, true)
  local dir = tostring(vim.fn.getcwd())
-- /home/artom/projects/scala/anki/src/main/scala/example/Main.scala
-- string.format("%s/main/scala/example/Main.scala", dir)


local messages = vim.fn.jobstart({ "sbt", "clean", "compile"}, {
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

vim.api.nvim_set_keymap("n", "<leader>rc", ":CompileCode<CR>", { noremap = true, silent = true })


vim.api.nvim_create_user_command("RunCode", function()
  local scratch_buffer = vim.api.nvim_create_buf(false, true)
  local dir = tostring(vim.fn.getcwd())
-- /home/artom/projects/scala/anki/src/main/scala/example/Main.scala
-- string.format("%s/main/scala/example/Main.scala", dir)


local messages = vim.fn.jobstart({ "sbt", "run"}, {
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


  vim.cmd("buffer " .. scratch_buffer)
  vim.opt_local.wrap = true
  vim.bo.buflisted = false
  vim.bo.bufhidden = "wipe"
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = scratch_buffer })
end, {})

vim.api.nvim_set_keymap("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = true })
