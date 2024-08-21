return {
   "akinsho/bufferline.nvim",
   event = "VeryLazy",
   keys = {
      {"<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer"},
      {"<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer"},
   },
   dependencies = {"nvim-tree/nvim-web-devicons"},
   version = "*",
   opts = {
      options = {
         mode = "tabs",
         -- separator_style = "slant",
         show_buffer_close_icons = false,
         show_close_icon = false,
         --
         diagnostics = "nvim_lsp",
         always_show_bufferline = false,
      },
   },
   -- config = function(_, opts)
   --    require("bufferline").setup(opts)
   --    -- Fix bufferline when restoring a session
   --    vim.api.nvim_creat_autocmd({ "BuffAdd", "BuffDelete" }, {
   --       callback = function()
   --          vim.schedule(function()
   --             pcall(nvim_bufferline)
   --          end)
   --       end,
   --    })
   -- end,
}
