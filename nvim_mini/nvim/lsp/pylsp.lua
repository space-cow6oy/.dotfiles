return {
  cmd = { "pylsp" },
  filetypes = { "python" },
  -- root_markers = { "", "" },

  settings = {
    plugins = {
      pylsp_mypy = {
        enabled = false,
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
