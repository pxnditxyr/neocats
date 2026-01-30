local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- move lines
keymap.set("n", "<A-j>", ":m .+1<Return>==", opts)
keymap.set("n", "<A-k>", ":m .-2<Return>==", opts)
keymap.set("v", "<A-j>", ":m '>+1<Return>gv=gv", opts)
keymap.set("v", "<A-k>", ":m '<-2<Return>gv=gv", opts)

-- join lines
keymap.set("n", "J", "mzJ`z", opts)

-- clipboard
keymap.set("n", "<leader>c", ":%d<CR>i", opts)
keymap.set("n", "<leader>y", ":%y<CR>", opts)
keymap.set("n", "<leader>x", ":%d<CR>", opts)
keymap.set("x", "<leader>p", '"_dP', opts)

keymap.set("n", "<leader>ll", "a<Space><Esc>h%i<Space><Esc>l%", opts)

-- Clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- save and quit
keymap.set("n", "<leader>z", ":q<CR>", opts)
keymap.set("n", "<leader>w", ":w<CR>", opts)

-- search
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- move in splits
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- move in tabs
keymap.set("n", "<leader>tn", ":tabnew<CR>", opts)
keymap.set("n", "<Tab>", ":tabnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":tabprevious<CR>", opts)

keymap.set("n", "<leader>rl", "<cmd>LspRestart<CR>", opts)

-- indent
keymap.set("v", "<", "<gv", { desc = "Indent out and keeps the selection" })
keymap.set("v", ">", ">gv", { desc = "Indent in and keeps the selection" })

-- run file
keymap.set("n", "<leader>bun", ":!bun %<CR>", opts)
-- keymap.set('n', '<leader>py', ':!python3 %<CR>', opts)

keymap.set("n", "<C-Up>", ":resize +5<CR>", opts)
keymap.set("n", "<C-Down>", ":resize -5<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", opts)

keymap.set("v", "<leader>jq", ":'<,'>!jq .<CR>", { desc = "Formatear JSON seleccionado con jq" })
