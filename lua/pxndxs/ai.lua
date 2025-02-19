return {
  "supermaven-inc/supermaven-nvim",
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'ai' ),
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
    ignore_filetypes = {},
    color = {
      suggestion_color = "#E8F9FF",
      cterm = 244,
    },
    log_level = "info",
    disable_inline_completion = false,
    disable_keymaps = false,
    condition = function()
      return false
    end,
  },
  config = function( _, opts )
    require( "supermaven-nvim" ).setup( opts )
  end,
}
