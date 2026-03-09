-- Diagnostics Configuration
vim.diagnostic.config({
  signs = {
    text = {
      [ vim.diagnostic.severity.ERROR ] = " ",
      [ vim.diagnostic.severity.WARN ] = " ",
      [ vim.diagnostic.severity.HINT ] = "󰌵 ",
      [ vim.diagnostic.severity.INFO ] = " ",
    },
    linehl = {
      [ vim.diagnostic.severity.ERROR ] = "ErrorMsg",
    },
    numhl = {
      [ vim.diagnostic.severity.WARN ] = "WarningMsg",
    },
  },
  float = {
    border = "rounded",
    source = true,
    prefix = " ", -- Spacing before the icon in floating window
    header = { " 󰌵 Diagnostics", "DiagnosticFloatingHint" },
  },
  virtual_text = {
    spacing = 4,
    prefix = "■", -- Modern solid square for errors
    severity = { min = vim.diagnostic.severity.ERROR }, -- Virtual text only for errors
  },
})

-- Auto-float: Automatically open diagnostics on cursor hover
vim.api.nvim_create_autocmd( "CursorHold", {
  callback = function ()
    -- Avoid opening if autocompletion menu is visible or not in normal mode
    if vim.api.nvim_get_mode().mode ~= "n" or vim.fn.pumvisible() ~= 0 then
      return
    end
    vim.diagnostic.open_float( nil, { focus = false, scope = "cursor" } )
  end,
} )

-- Shortcuts for diagnostic navigation
vim.keymap.set( 'n', '[d', function () vim.diagnostic.jump({ count = -1, float = true }) end )
vim.keymap.set( 'n', ']d', function () vim.diagnostic.jump({ count = 1, float = true }) end )
