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
      -- current line background
      colors.bg_highlight = '#0f172a'
      colors.terminal_black = '#414868'
      -- normal text color
      colors.fg = '#fde68a'
      colors.fg_dark = '#a9b1d6'
      colors.fg_gutter = '#3b4261'
      colors.dark3 = '#545c7e'
      -- comment color
      colors.comment = '#895f89'
      -- current line number color
      colors.dark5 = '#737aa2'
      colors.blue0 = '#3d59a1'
      -- function calls, methods, and some variable definitions
      colors.blue = '#0CECDD'
      colors.cyan = '#0bf947'
      colors.blue1 = '#2ac3de'
      colors.blue2 = '#0db9d7'
      colors.blue5 = '#89ddff'
      colors.blue6 = '#B4F9F8'
      colors.blue7 = '#394b70'
      -- keywords: if, for, while, function instances, etc.
      colors.magenta = '#f43f5e'
      colors.magenta2 = '#d946ef'
      -- return, local, etc.
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
    end,
    on_highlights = function( hl, c )
      hl.FloatBorder = {
        fg = c.blue,
      }
      hl.NormalFloat = {
        bg = c.bg_dark,
      }
      -- BlinkCmp consistency
      hl.BlinkCmpMenu = { bg = c.bg_dark }
      hl.BlinkCmpMenuBorder = { fg = c.blue }
      hl.BlinkCmpDoc = { bg = c.bg_dark }
      hl.BlinkCmpDocBorder = { fg = c.blue }
      hl.BlinkCmpSignatureHelp = { bg = c.bg_dark }
      hl.BlinkCmpSignatureHelpBorder = { fg = c.blue }

      hl.DiagnosticFloatingError = { fg = c.red }
      hl.DiagnosticFloatingWarn  = { fg = c.yellow }
      hl.DiagnosticFloatingInfo  = { fg = c.blue }
      hl.DiagnosticFloatingHint  = { fg = c.cyan }
    end
  },
  config = function( _, opts )
    require( "tokyonight" ).setup( opts )
    vim.cmd[[colorscheme tokyonight]]
  end,
}
