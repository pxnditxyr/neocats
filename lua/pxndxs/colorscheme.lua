return {
  "folke/tokyonight.nvim",
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'ui' ),
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    transparent = true,

  },
  config = function( _, opts )
    require( "tokyonight" ).setup( opts )
    vim.cmd[[colorscheme tokyonight]]
  end,
}
