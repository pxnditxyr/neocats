local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- move lines
keymap.set( 'n', '<A-j>', ':m .+1<Return>==', opts )
keymap.set( 'n', '<A-k>', ':m .-2<Return>==', opts )
keymap.set( 'v', '<A-j>', ':m \'>+1<Return>gv=gv', opts )
keymap.set( 'v', '<A-k>', ':m \'<-2<Return>gv=gv', opts )

-- join lines
keymap.set( 'n', 'J', 'mzJ`z', opts )

-- clipboard
keymap.set( 'n', '<leader>c', ':%d<CR>i', opts )
keymap.set( 'n', '<leader>y', ':%y<CR>', opts )
keymap.set( 'n', '<leader>x', ':%d<CR>', opts )
keymap.set( 'x', '<leader>p', '"_dP', opts )

keymap.set( 'n', '<leader>ll', 'a<Space><Esc>h%i<Space><Esc>l%', opts )


-- save and quit
keymap.set( 'n', '<leader>z', ':q<CR>', opts )
keymap.set( 'n', '<leader>w', ':w<CR>', opts )

-- search
keymap.set( 'n', 'n', 'nzzzv', opts )
keymap.set( 'n', 'N', 'Nzzzv', opts )

-- move in splits
keymap.set( 'n', '<C-h>', '<C-w>h', opts )
keymap.set( 'n', '<C-j>', '<C-w>j', opts )
keymap.set( 'n', '<C-k>', '<C-w>k', opts )
keymap.set( 'n', '<C-l>', '<C-w>l', opts )

-- move in tabs
keymap.set( 'n', '<Tab>', ':tabnext<CR>', opts )
keymap.set( 'n', '<S-Tab>', ':tabprevious<CR>', opts )

keymap.set( 'n', '<leader>rl', "<cmd>LspRestart<CR>", opts )

-- indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent out and keeps the selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent in and keeps the selection" })

-- run file
vim.keymap.set('n', '<leader>bun', ':!bun %<CR>', opts)
-- vim.keymap.set('n', '<leader>py', ':!python3 %<CR>', opts)
