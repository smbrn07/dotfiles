return {
   "windwp/nvim-autopairs",
   event = {"InsertEnter"},
   config = function()
      -- import nvim-autopairs
      local autopairs = require("nvim-autopairs")

      -- configure autopairs
      autopairs.setup({
         check_ts = true, -- enable treesitter
      })
   end,
}

