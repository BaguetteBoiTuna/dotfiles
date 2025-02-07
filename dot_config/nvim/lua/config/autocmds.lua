-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Enable by default the ShowkeysToggle for the keystrokes at the top right
vim.cmd("ShowkeysToggle")

-- Enable diagnostic virtual lines
vim.diagnostic.config({ virtual_lines = true })
