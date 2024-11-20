vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("lazy-manager")
require("keymaps")
require("option")

vim.keymap.set('n', '<leader>r', ':w<CR>', {noremap = true, silent = true})


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop=2

