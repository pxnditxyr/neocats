return {
  {
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
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPost',
    opts = {
      enable = true,
    }
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has( "nvim-0.10.0" ) == 1,
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'BufReadPost',
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false
      },
      -- per_filetype = {
      --   ["html"] = {
      --     enable_close = false
      --   }
      -- }
    },
    config = function( _, opts )
      require( 'nvim-ts-autotag' ).setup( opts )
    end,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = 'BufReadPost',
    init = function ()
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
      vim.api.nvim_set_hl( 0, 'RainbowDelimiterRed', { fg = '#ff2442' } )
      vim.api.nvim_set_hl( 0, 'RainbowDelimiterYellow', { fg = '#73ff00' } )
      vim.api.nvim_set_hl( 0, 'RainbowDelimiterBlue', { fg = '#00ff9d' } )
      vim.api.nvim_set_hl( 0, 'RainbowDelimiterOrange', { fg = '#e28400' } )
      vim.api.nvim_set_hl( 0, 'RainbowDelimiterGreen', { fg = '#06D001' } )
      vim.api.nvim_set_hl( 0, 'RainbowDelimiterViolet', { fg = '#bbff00' } )
      vim.api.nvim_set_hl( 0, 'RainbowDelimiterCyan', { fg = '#ff00ff' } )
      -- local test = (((((((())))))))
    end
  }
}
