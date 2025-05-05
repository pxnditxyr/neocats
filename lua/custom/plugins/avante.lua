return {
  'yetone/avante.nvim',
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'ai' ),
  event = "VeryLazy",
  lazy = false,
  version = '*',
  opts = {
    provider = "copilot",
    behavior = {
      auto_suggestions = false,
    }
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "echasnovski/mini.icons", opts = {} },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      opts = {
        suggestion = { enabled = false },
        copilot_node_command = vim.fn.expand( "$HOME" ) .. "/.local/share/fnm/aliases/default/bin/node",
        panel = { enabled = false },
      },
      config = function( _, opts )
        require( "copilot" ).setup( opts )
      end,
    },
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
