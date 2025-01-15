-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- always keep 8 lines above/below the cursor
vim.opt.scrolloff = 8

-- for markdown using obsidian.nvim
vim.opt.conceallevel = 2

-- MacOS fixing python3_host_prog
vim.g.python3_host_prog = "/Users/dante/opt/miniconda3/envs/tf/bin/python"

-- changing color of the indent lines
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#5b595c" })
