return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {

    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      {
        "L3MON4D3/LuaSnip",
        version = 'v2.*',
        name = "luasnip",
        config = function()
          require( "luasnip.loaders.from_vscode" ).lazy_load()
        end
      },
      { "echasnovski/mini.icons", opts = {} },
      { "moyiz/blink-emoji.nvim" },
    },
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ["<Tab>"] = {},
        ["<S-Tab>"] = {},
      },

      signature = {
        enabled = true,
        trigger = {
          enabled = false,
        },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
        kind_icons = {
          Class = "󰌔",
          Color = "🎨",
          Constant = "🔑",
          Constructor = "🛠️",
          Enum = "🔢",
          EnumMember = "🔸",
          Event = "📣",
          Field = "",
          File = "📄",
          Folder = "📂",
          Function = "🔨",
          Interface = "🌐",
          Keyword = "💡",
          Method = "⚙️ ",
          Module = "📦",
          Operator = "➗",
          Property = "🏠",
          Reference = "🔍",
          Snippet = "📑",
          Struct = "🛠️",
          Text = "📜",
          TypeParameter = "🔠",
          Unit = "📏",
          Value = "💎",
          Variable = "🔄",
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15,
            opts = { insert = true },
          }
        }
      },
      completion = {
        menu = {
          auto_show = function( ctx )
            if vim.tbl_contains( { 'markdown' }, vim.bo.filetype ) then
              return false
            end

            return ctx.mode ~= "cmdline" or not vim.tbl_contains( { '/', '?' }, vim.fn.getcmdtype() )
          end,
        },
      },
    },
    opts_extend = { "sources.default" },
    config = function( _, opts )
      if ( require( "nixCatsUtils" ).isNixCats ) then
        opts.fuzzy = { prebuilt_binaries = { download = false } }
      end
      require( "blink-cmp" ).setup( opts )
    end
  }
}
