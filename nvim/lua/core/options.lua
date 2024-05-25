-- 24-bit color
vim.opt.termguicolors = true

-- Some setting changes
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo//'

-- Transparent bg

vim.g.mapleader = " "

-- Auto save
vim.g.auto_save = 1

-- Line nums
vim.o.relativenumber = true

-- Set Vimtex compiler options
vim.g.vimtex_compiler_latexmk = {
    executable = 'latexmk',
    options = {
        '-pdf',
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
    },
}


