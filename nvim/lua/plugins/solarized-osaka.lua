return {
   "craftzdog/solarized-osaka.nvim",
   lazy = false,
   priority = 1000,
   config = function()
      require("solarized-osaka").setup ({
         transparent_background = true,
         styles = {
            sidebars = "transparent",
            -- floats = "transparent",
         },
      })
      vim.cmd("colorscheme solarized-osaka")
   end,
}
