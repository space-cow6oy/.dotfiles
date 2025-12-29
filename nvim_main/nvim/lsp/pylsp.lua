return {
  cmd = { "pylsp" },
  filetypes = { "python" },
  -- root_markers = { "", "" },

  settings = {
    plugins = {
      pylsp_mypy = {
        enabled = true,
        live_mode = true,
      },
      pylint = {
        enabled = true, -- Example: disable pylint if you use another linter
      },
      pydoclint = {
        enabled = true,
      },
    },
  },
}

-- function get_python_path()
--   -- Check if there's an active virtual environment
--   local venv_path = os.getenv("VIRTUAL_ENV")
--   if venv_path then
--     return venv_path .. "/bin/python3"
--   else
--     return "/usr/bin/python3"
--   end
-- end
