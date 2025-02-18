return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  cmd = { "Oil" },
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'file-manager' ),
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Open Oil" },
  }
}
