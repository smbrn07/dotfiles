return {
  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = {
      editor = {
        tooltip = "kocoj",
      },
    }, -- calls require('cord').setup()
  },
  -- {
  --   "andweeb/presence.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
}
