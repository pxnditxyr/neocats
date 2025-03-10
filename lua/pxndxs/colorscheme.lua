return {
  "folke/tokyonight.nvim",
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'ui' ),
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    transparent = true,
    on_colors = function( colors )
      colors.bg_dark = '#1f2335'
      colors.bg = '#24283b'
      -- color of the current line
      colors.bg_highlight = '#0f172a'
      colors.terminal_black = '#414868'
      -- normal color
      colors.fg = '#fde68a'
      colors.fg_dark = '#a9b1d6'
      colors.fg_gutter = '#3b4261'
      colors.dark3 = '#545c7e'
      -- comment color
      colors.comment = '#895f89'
      -- color of current line number
      colors.dark5 = '#737aa2'
      colors.blue0 = '#3d59a1'
      -- color of functions calls, methods, and some definition of variables
      colors.blue = '#0CECDD'
      colors.cyan = '#0bf947'
      colors.blue1 = '#2ac3de'
      colors.blue2 = '#0db9d7'
      colors.blue5 = '#89ddff'
      colors.blue6 = '#B4F9F8'
      colors.blue7 = '#394b70'
      -- color of sentencies like if, for, while, instance of functions, etc.
      colors.magenta = '#f43f5e'
      colors.magenta2 = '#d946ef'
      -- color of return local, etc.
      colors.purple = '#FF33BB'
      colors.orange = '#ff9e64'
      colors.yellow = '#fde047'
      colors.green = '#a3e635'
      colors.green1 = '#34d399'
      colors.green2 = '#4ade80'
      colors.teal = '#0d9488'
      colors.red = '#ef4444'
      colors.red1 = '#dc2626'
      colors.git = {
        change = '#FDFD44',
        add = '#9CFF2E',
        delete = '#ef4444',
        conflict = '#bb7a61'
      }
      colors.gitSigns = {
        add = '#9CFF2E',
        change = '#FDFD44',
        delete = '#ef4444'
      }
    end
  },
  config = function( _, opts )
    require( "tokyonight" ).setup( opts )
    vim.cmd[[colorscheme tokyonight]]
  end,
}
