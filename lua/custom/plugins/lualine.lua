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
      lualine_a = { 'mode' },
      lualine_b = { 'filename', 'diff', 'diagnostics' },
      lualine_c = { { get_name } },
      lualine_x = { 'branch' },
      lualine_y = { 'filetype', 'fileformat' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'filename' },
      lualine_z = { 'location' }
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
