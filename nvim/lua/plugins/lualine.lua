return {
   "nvim-lualine/lualine.nvim",
   even = "VeryLazy",
   dependencies = {"nvim-tree/nvim-web-devicons"},

   config = function()
      local lazy_status = require("lazy.status") -- to configure lazy pending updates count
      require('lualine').setup {
         options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
            disabled_filetypes = {
               statusline = {},
               winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
               statusline = 1000,
               tabline = 1000,
               winbar = 1000,
            }},
            sections = {
               lualine_a = {'mode'},
               lualine_b = {'branch'},
               lualine_c = {
                  {
                     "diagnostics",
                     -- symbols = {
                     --   error = icons.diagnostics.Error,
                     --   warn = icons.diagnostics.Warn,
                     --   info = icons.diagnostics.Info,
                     --   hint = icons.diagnostics.Hint,
                     -- },
                  },
                  {
                     "filetype", icon_only = true, separator = "", padding = {left = 1, right = 0},
                     colored = true, -- Displays filetype icon in color if set to true
                     -- icon =    {'X', align='right'}
                     -- Icon string ^ in table is ignored in filetype component
                  },
                  {
                     'filename', padding = {left = 0, right = 2},
                     file_status = true, -- Displays file status (readonly status, modified status)
                     newfile_status = false, -- Display new file status (new file means no write after created)
                     path = 4, -- 0: Just the filename
                     -- 1: Relative path
                     -- 2: Absolute path
                     -- 3: Absolute path, with tilde as the home directory
                     -- 4: Filename and parent dir, with tilde as the home directory

                     shorting_target = 10, -- Shortens path to leave 40 spaces in the window
                     -- for other components. (terrible name, any suggestions?)
                     symbols = {
                        modified = '[+]', -- Text to show when the file is modified.
                        readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                        newfile = '[New]', -- Text to show for newly created file before first write
                     }}},
                     lualine_x = {'diff'},
                     lualine_y = {
                        {"progress", separator = "", padding = {left = 1, right = 0}},
                        {"location", padding = {left = 0, right = 1}},
                     },
                     lualine_z = {
                        function()
                           return " " .. os.date("%R")
                        end,
                     }},
                     inactive_sections = {
                        lualine_a = {},
                        lualine_b = {},
                        lualine_c = {'filename'},
                        lualine_x = {'location'},
                        lualine_y = {},
                     lualine_z = {}},
                     tabline = {},
                     winbar = {},
                     inactive_winbar = {},
                  extensions = {}}
               end
            }

           