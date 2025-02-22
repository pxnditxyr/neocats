vim.api.nvim_create_autocmd( "BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd( [[%s/\r//e]] )
    vim.cmd( [[%s/\s\+$//e]] )
    vim.cmd( [[%s/\($\n\s*\)\+\%$//e]] )
  end,
} )
