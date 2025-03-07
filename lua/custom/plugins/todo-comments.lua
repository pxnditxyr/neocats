return {
  'folke/todo-comments.nvim',
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'syntax' ),
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {},
}
