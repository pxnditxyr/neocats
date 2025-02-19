
return {
  'lewis6991/gitsigns.nvim',
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'git' ),
  opts = {
    signs = {
      add          = { text = '󱝹'  },
      change       = { text = ''  },
      delete       = { text = '󱂧'  },
      topdelete    = { text = '✎'  },
      changedelete = { text = ''  },
      untracked    = { text = '❓' },
    },
    signs_staged = {
      add          = { text = '✚'  },
      change       = { text = '🖌️' },
      delete       = { text = '✖'  },
      topdelete    = { text = '⌃'  },
      changedelete = { text = '✌'  },
      untracked    = { text = '❓' },
    },
    signs_staged_enable = true,
    signcolumn = true,
    numhl      = false,
    linehl     = false,
  }
}
