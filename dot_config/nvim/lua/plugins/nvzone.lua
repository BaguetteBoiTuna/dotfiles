return {
  -- Typr : Typing practice for Neovim with dashboard
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  -- Showkeys : Minimal keys screencaster
  {
    "nvzone/showkeys",
    opts = {
      position = "top-right",
      show_count = true,
    },
    cmd = { "ShowkeysToggle" },
  },
}
