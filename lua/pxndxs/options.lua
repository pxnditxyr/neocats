vim.g.mapleader      = " "
vim.g.maplocalleader = " "


vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.clipboard = "unnamedplus"

-- Popup and UI
vim.o.pumheight = 10

-- UI General
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.laststatus = 3
vim.o.showmode = false
vim.o.errorbells = false
vim.o.mouse = ""
vim.o.guicursor = ""

-- Indentation
vim.o.expandtab   = true
vim.o.tabstop     = 2
vim.o.shiftwidth  = 2
vim.o.softtabstop = 2
vim.o.autoindent  = true
vim.o.smartindent = true
vim.o.wrap = false

-- Files and backups
vim.o.swapfile = false
vim.o.undofile = true

-- Searching
vim.o.incsearch = true
vim.o.hlsearch  = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Scroll
vim.o.scrolloff     = 8
vim.o.sidescrolloff = 8

-- Spelling
vim.o.spell     = true
vim.o.spelllang = "en_us"

-- Windows
vim.o.splitbelow = true
vim.o.splitright = true


-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldenable = true

-- Clean of messages
vim.opt.shortmess:append("c")
