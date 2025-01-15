return {
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
          comment = { italic = true },
          keyword = { italic = true },
          type = { italic = true },
          storageclass = { italic = true },
          structure = { italic = true },
          parameter = { italic = true },
          annotation = { italic = true },
          tag_attribute = { italic = true },
        },
        background_clear = {
          "float_win",
          "toggleterm",
        },
        override = function(c)
          return {
            SnacksIndent = { fg = c.base.dimmed4 },
          }
        end,
      })
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
