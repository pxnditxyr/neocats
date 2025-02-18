return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'fuzzy-finder' ),
  opts = {},
  config = function( _, opts )
    require( 'fzf-lua' ).setup( opts )
    -- vim.keymap.set( 'n', '<leader>ff', require( 'fzf-lua' ). )
  end,
}
