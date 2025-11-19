return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = { "Neogit" },
  keys = {
    { "<leader>gg", "<cmd>Neogit kind=split_above<cr>", desc = "Open Neogit" },
  },
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'git' ),
  opts = {
    graph_style = "unicode",
  }
}
