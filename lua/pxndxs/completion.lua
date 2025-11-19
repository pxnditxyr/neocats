local is_wsl = (function()
  local os_uname = vim.loop.os_uname()
  local version = os_uname.version:lower()
  local release = os_uname.release:lower()
  return version:find('microsoft') ~= nil or version:find('wsl') ~= nil
      or release:find('microsoft') ~= nil or release:find('wsl') ~= nil
end)()

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
        ["<C-f>"] = { "snippet_forward", "fallback" },
        ["<C-g>"] = { "snippet_backward", "fallback" },
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
          Snippet = " ",
          Struct = "🛠️",
          Text = "📜",
          TypeParameter = "🔠",
          Unit = "📏",
          Value = "💎",
          Variable = "🔄",
        },
      },

      snippets = {
        preset = "luasnip"
      },

      cmdline = {
        enabled = not is_wsl
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji', 'lazydev' },
        per_filetype = {
          sql = { 'snippets', 'dadbod', 'buffer', 'emoji' },
          lua = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        },
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15,
            opts = { insert = true },
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink"
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        }
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        menu = {
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if ctx.item.source_name == "LSP" then
                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr ~= "" then
                      icon = color_item.abbr
                    end
                  end
                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local highlight = "BlinkCmpKind" .. ctx.kind
                  if ctx.item.source_name == "LSP" then
                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr_hl_group then
                      highlight = color_item.abbr_hl_group
                    end
                  end
                  return highlight
                end,
              }
            }
          }
        },
      -- completion = {
      --   menu = {
      --     auto_show = function( ctx )
      --       if vim.tbl_contains( { 'markdown' }, vim.bo.filetype ) then
      --         return false
      --       end
      --
      --       return ctx.mode ~= "cmdline" or not vim.tbl_contains( { '/', '?' }, vim.fn.getcmdtype() )
      --     end,
      --   },
      -- },
      }
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
