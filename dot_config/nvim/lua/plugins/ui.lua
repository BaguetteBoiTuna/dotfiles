return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = false,
        },
        sections = {
          {
            section = "terminal",
            cmd = "chafa ~/.config/nvim/dashimg.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
            height = 17,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
      terminal = {
        win = {
          wo = {
            winbar = "",
          },
        },
      },
    },
  },
}
