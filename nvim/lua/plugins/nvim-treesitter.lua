return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
         local config = require("nvim-treesitter.configs")
         config.setup({
            ensure_installed = {
               "bash",
               "c",
               "cpp",
               "diff",
               "fish",
               "lua",
               "luadoc",
               "luap",
               "vim",
               "vimdoc",
            },
            highlight = { enable = true },
            indent = { enable = true },
         })
      end,
   },
}
