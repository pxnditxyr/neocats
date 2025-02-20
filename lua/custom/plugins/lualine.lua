local function get_name()
  return '🐼 pxndxs 😼'
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { "echasnovski/mini.icons" },
  enabled = require( 'nixCatsUtils' ).enableForCategory( 'ui' ),
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {
				{
					"mode",
          fmt = function(str)
            local emoji_table = {
              ["NORMAL"] = "🐈",
              ["INSERT"] = "🐼",
              ["VISUAL"] = "🐱",
              ["V-LINE"] = "🐯",
              ["V-BLOCK"] = "🦢",
              ["REPLACE"] = "🐳",
              ["COMMAND"] = "🦝",
              ["TERMINAL"] = "🐚",
            }
            return ( emoji_table[ str ] or "❓" ) .. " " .. str
          end,
          upper = true,
				},
			},
      lualine_b = {
        {
          'filename',
          file_status = true,
          path = 1,
          symbols = {
            modified = "📝",
            readonly = "🔒",
            unnamed = "😶",
            newfile = "🌚",
          },
        },
        'diff',
      },
      lualine_c = { { get_name } },

      lualine_x = {
        'searchcount',
        'diagnostics',
        { 'branch', icon = '', color = { fg = '#f34f29' } },
      },
      lualine_y = { 'filetype' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { get_name } },
      lualine_x = { { 'branch', icon = '', color = { fg = '#f34f29' } } },
      lualine_y = { 'filename' },
      lualine_z = { 'location' }
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
