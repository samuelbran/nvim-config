vim.opt.backup = false
vim.opt.swapfile = false
vim.o.background = 'dark'
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.o.termguicolors = true
vim.cmd[[colorscheme nord]]

vim.o.splitbelow = true
vim.opt.splitright = true
vim.o.ignorecase = true
vim.o.updatetime = 300

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'
vim.opt.signcolumn = "yes"
vim.wo.wrap = false
vim.wo.colorcolumn = '80'
vim.wo.cursorline = true

vim.g.mapleader = ' '
vim.g.hidden = true

vim.b.mapleader = ' '

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.cmd('language en_US.utf-8')
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }

