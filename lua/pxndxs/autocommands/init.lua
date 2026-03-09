require( 'pxndxs.autocommands.del-after-save' )

-- Highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Close specific window types with 'q'
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'qf',
    'notify',
    'checkhealth',
    'lspinfo',
    'man',
    'startuptime',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Restore cursor position on file open
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Automatically create parent directories if they don't exist when saving
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(event)
    if event.match:match('^%w%w+:[\\/][\\/]') then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- Integration with Lazygit to avoid nested instances
-- Configures GIT_EDITOR dynamically based on the Neovim server
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = function()
    if vim.fn.executable("nvr") == 1 then
      -- 'remote-wait' ensures Neovim waits for the commit message to be finished
      vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    end
  end,
})
