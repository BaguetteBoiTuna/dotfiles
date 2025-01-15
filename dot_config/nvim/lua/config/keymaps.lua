-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- shortening vim.api.nvim_set_keymap to v_key
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- helper function to streamline remapping
local function remap_keys(modes, key_mappings)
  for _, mode in ipairs(modes) do
    for original, replacement in pairs(key_mappings) do
      vim.keymap.set(
        mode,
        original,
        replacement,
        { noremap = true, silent = true }
      )
    end
  end
end
-- define movement remaps
local movement_remap = {
  i = "k",
  I = "K",
  k = "j",
  K = "J",
  j = "h",
  J = "H",
  h = "i",
  H = "I",
}
-- apply remapping only to movement modes
remap_keys({ "n", "v", "o" }, movement_remap)

-- shift + alt + j to change window to the left
-- since shift + alt + l is to change window to the right
keymap.set("n", "<S-A-j>", "<cmd>BufferLineCyclePrev<cr>", opts)

-- obsidian.nvim keymaps

keymap.set(
  "n",
  "<leader>oc",
  "<cmd>lua require('obsidian').util.toggle_checkbox()<cr>",
  opts
)
keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", opts)
keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", opts)
keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", opts)
keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", opts)
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", opts)
keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", opts)
keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", opts)
