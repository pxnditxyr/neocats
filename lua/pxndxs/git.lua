return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",

    "ibhagwan/fzf-lua",
  },
  cmd = { "Neogit" },
  keys = {
    { "<leader>gg", "<cmd>Neogit kind=split_above<cr>", desc = "Open Neogit" },
  },
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'git' ),
  opts = {}
}
