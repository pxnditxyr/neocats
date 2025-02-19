return {
  'nvim-treesitter/nvim-treesitter',
  build = require( 'nixCatsUtils' ).lazyAdd( ':TSUpdate' ),
  opts = {
    ensure_installed = require( 'nixCatsUtils' ).lazyAdd({ 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' }),
    auto_install = require( 'nixCatsUtils' ).lazyAdd( true, false ),

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function( _, opts )
    require( 'nvim-treesitter.install' ).prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require( 'nvim-treesitter.configs' ).setup( opts )
  end,
}
