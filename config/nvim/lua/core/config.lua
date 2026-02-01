-- Enable syntax highlighting and filetype plugins
vim.cmd("syntax on")
vim.o.termguicolors = false

vim.cmd("filetype plugin indent on")

-- Line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true

-- Matching brackets
vim.opt.showmatch = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Command-line completion
vim.opt.wildmenu = true

-- Backspace behavior
vim.opt.backspace = { "indent", "eol", "start" }

-- Line wrapping
vim.opt.wrap = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

