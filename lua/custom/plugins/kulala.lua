return {
  'mistweaverco/kulala.nvim',
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'http' ),
  keys = {
    {
      '<leader>rs',
      function() require( 'kulala' ).run() end,
      mode = { 'n', 'v' },
      desc = 'Run Kulala'
    },
    {
      '<leader>ra',
      function() require( 'kulala' ).run_all() end,
      mode = { 'n', 'v' },
      desc = 'Run Kulala (Global)'
    },
  },
  ft = { 'http', 'rest' },
  opts = {
    global_keymaps = false
  }
}
