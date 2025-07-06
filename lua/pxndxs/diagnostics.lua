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
})

vim.keymap.set( 'n', '[d', function () vim.diagnostic.jump({ count = -1, float = true }) end )
vim.keymap.set( 'n', ']d', function () vim.diagnostic.jump({ count = 1, float = true }) end )
