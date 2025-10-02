return {
  {
    "nvim-lua/plenary.nvim",
    keys = {
      {
        "<leader>gd",
        function()
          require("lazyvim.util").terminal.open(
            { "gh", "dash" },
            { cwd = LazyVim.root.get() }
          )
        end,
        desc = "gh-dash (root dir)",
      },
      {
        "<leader>gD",
        function()
          require("lazyvim.util").terminal.open(
            { "gh", "dash" },
            { cwd = vim.loop.cwd() }
          )
        end,
        desc = "gh-dash (cwd)",
      },
    },
  },
}
