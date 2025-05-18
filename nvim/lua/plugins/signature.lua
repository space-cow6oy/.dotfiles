return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded"
    },
	select_signature_key = "<a-n>",
	move_cursor_key = "<a-i>",
   keymaps = { { 'jj', '<C-o>5<Down>' }, { 'k', '<C-o>2k' }, {'j', '<C-o>5<Down>' },}
  -- or use config
  -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
},
}
