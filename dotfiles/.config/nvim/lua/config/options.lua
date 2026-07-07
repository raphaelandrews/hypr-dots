-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.g.lazyvim_check_order = false

vim.opt.scrolloff = 10
vim.opt.numberwidth = 5
vim.opt.scroll = 15

-- Treesitter-based folding, start with all folds open
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
