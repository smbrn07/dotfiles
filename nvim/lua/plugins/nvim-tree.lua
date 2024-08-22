return {
   "nvim-tree/nvim-tree.lua",
   version = "*",
   lazy = false,
   dependencies = {
      "nvim-tree/nvim-web-devicons",
   },
   config = function()
      require("nvim-tree").setup({
         sort = {
            sorter = "case_sensitive",
         },
         view = {
            width = 25,
         },
         renderer = {
            group_empty = true,
         },
         filters = {
            dotfiles = true,
         },
      })

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {desc = "Toggle file explorer"}) -- toggle file explorer
      keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {desc = "Toggle file explorer on current file"}) -- toggle file explorer on current file
      keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {desc = "Collapse file explorer"}) -- collapse file explorer
      keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {desc = "Refresh file explorer"}) -- refresh file explorer

   end,
}
