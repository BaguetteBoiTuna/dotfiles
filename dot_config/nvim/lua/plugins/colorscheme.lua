return {
  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
    end,
  },
  -- monokai-pro
  {
    "loctvl842/monokai-pro.nvim",
    name = "monokai-pro",
    config = function()
      require("monokai-pro").setup({
        filter = "spectrum",
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
        styles = {
          comment = {italic = true},
          keyword = {italic = true},
          type = {italic = true},
          storageclass = {italic = true},
          structure = {italic = true},
          parameter = {italic = true},
          annotation = {italic = true},
          tag_attribute = {italic = true},
        },
        background_clear = {
          "float_win",
          "toggleterm",
          "neo-tree",
          "lazygit",
          "telescope",
          "renamer",
          "notify",
          "alpha",
          "bufferline",
          "cmp",
          "vim-illuminate",
          "indent_blankline",
          "lualine",
          "which-key",
          "breadcumbs",
          "mason",
        }
      })
    end,
  },
  -- sonokai
  {
    "sainnhe/sonokai",
    name = "sonokai",
    config = function()
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_disable_italic_comment = 0
      vim.g.sonokai_transparent_background = 1
    end,
  },
  -- lazyvim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
