local signs = {
  Error = " ",
  Warn = " ",
  Hint = "󰌵 ",
  Info = " "
}

vim.diagnostic.config({
  signs = {
    error = { text = signs.Error, texthl = "DiagnosticSignError" },
    warn = { text = signs.Warn, texthl = "DiagnosticSignWarn" },
    hint = { text = signs.Hint, texthl = "DiagnosticSignHint" },
    info = { text = signs.Info, texthl = "DiagnosticSignInfo" },
  }
})

vim.keymap.set( 'n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end )
vim.keymap.set( 'n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end )
