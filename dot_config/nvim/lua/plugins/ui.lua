return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = true,
        },
        sections = {
          {
            section = "terminal",
            cmd = "cat ~/.config/nvim/chafa_cache/$(ls ~/.config/nvim/chafa_cache | shuf -n 1); sleep .1",
            ttl = 0,
            height = 17,
            padding = 1,
          },
          {
            pane = 2,
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
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
