-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- shortening vim.api.nvim_set_keymap to v_key
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- swapping around movement keys to be more comfortable for gamers
-- (im sorry if you use vim keys religiously)
keymap.set("n", "i", "k", opts)
keymap.set("n", "I", "K", opts)
keymap.set("n", "k", "j", opts)
keymap.set("n", "K", "J", opts)
keymap.set("n", "j", "h", opts)
keymap.set("n", "J", "H", opts)
keymap.set("n", "h", "i", opts)
keymap.set("n", "H", "I", opts)

-- same for visual mode
keymap.set("v", "i", "k", opts)
keymap.set("v", "I", "K", opts)
keymap.set("v", "k", "j", opts)
keymap.set("v", "K", "J", opts)
keymap.set("v", "j", "h", opts)
keymap.set("v", "J", "H", opts)
keymap.set("v", "h", "i", opts)
keymap.set("v", "H", "I", opts)

-- shift + alt + j to change window to the left
-- since shift + alt + l is to change window to the right
keymap.set("n", "<S-A-j>", "<cmd>BufferLineCyclePrev<cr>", opts)

-- obsidian.nvim keymaps

keymap.set("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<cr>", opts)
keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", opts)
keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", opts)
keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", opts)
keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", opts)
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", opts)
keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", opts)
keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", opts)
