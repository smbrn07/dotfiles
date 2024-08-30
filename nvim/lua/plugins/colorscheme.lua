return {
  -- add themes here
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- Configure LazyVim to load nord
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "nord",
  --   },
  -- },
}
