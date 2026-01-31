return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = 'ys',
          delete = 'ds',
          find = 'zf',           -- Cambiado de 'sf' a 'zf'
          find_left = 'zF',      -- Cambiado de 'sF' a 'zF'
          highlight = 'zh',      -- Cambiado de 'sh' a 'zh'
          replace = 'cs',
          update_n_lines = 'zn', -- Cambiado de 'sn' a 'zn'

          suffix_last = 'l',
          suffix_next = 'n',
        },
      })
      require('mini.ai').setup({
        n_lines = 500,
        custom_textobjects = {
        },
      })

      require('mini.move').setup({
        mappings = {
          left = '<A-h>',
          right = '<A-l>',
          down = '<A-j>',
          up = '<A-k>',

          line_left = '<A-h>',
          line_right = '<A-l>',
          line_down = '<A-j>',
          line_up = '<A-k>',
        },
      })

      require('mini.bracketed').setup({
        buffer     = { suffix = 'b', options = {} },
        comment    = { suffix = 'c', options = {} },
        conflict   = { suffix = 'x', options = {} },
        diagnostic = { suffix = 'd', options = {} },
        file       = { suffix = 'f', options = {} },
        indent     = { suffix = 'i', options = {} },
        jump       = { suffix = 'j', options = {} },
        location   = { suffix = 'l', options = {} },
        oldfile    = { suffix = 'o', options = {} },
        quickfix   = { suffix = 'q', options = {} },
        treesitter = { suffix = 't', options = {} },
        undo       = { suffix = 'u', options = {} },
        window     = { suffix = 'w', options = {} },
        yank       = { suffix = 'y', options = {} },
      })
    end,
  },
}
