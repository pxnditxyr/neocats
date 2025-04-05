return {
  'rcarriga/nvim-notify',
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'ui' ),
  lazy = false,
  config = function ()
    require( 'notify' ).setup({})
  end,
  keys = {
    {
      '<leader>nd', function()
        require( 'notify' ).dismiss({})
      end,
      desc = 'Dismiss notification'
    },
  }
}
