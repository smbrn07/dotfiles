return {
  'b0o/incline.nvim',
  -- Optional: Lazy load Incline
  event = 'VeryLazy',
  config = function()
    local helpers = require 'incline.helpers'
    local devicons = require 'nvim-web-devicons'
    require('incline').setup {
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
            local ft_icon, ft_color = devicons.get_icon_color(filename)
            local modified = vim.bo[props.buf].modified
            return {
              ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
              ' ',
              { filename, gui = modified and 'bold,italic' or 'bold' },
              ' ',
        }
      end,
      debounce_threshold = {
      falling = 50,
      rising = 10
      },
      hide = {
        cursorline = true,
        focused_win = false,
        only_win = false
      },
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = "NormalFloat"
          },
          InclineNormalNC = {
            default = true,
            group = "NormalFloat"
          }
        }
      },
      ignore = {
        buftypes = "special",
        filetypes = {},
        floating_wins = true,
        unlisted_buffers = true,
        wintypes = "special"
      },
      render = "basic",
      window = {
        margin = {
          horizontal = 1,
          vertical = 0
        },
        options = {
          signcolumn = "no",
          wrap = false
        },
        overlap = {
          borders = true,
          statusline = false,
          tabline = false,
          winbar = false
        },
        padding = 1,
        padding_char = " ",
        placement = {
          horizontal = "right",
          vertical = "top"
        },
        width = "fit",
        winhighlight = {
          active = {
            EndOfBuffer = "None",
            Normal = "InclineNormal",
            Search = "None"
          },
          inactive = {
            EndOfBuffer = "None",
            Normal = "InclineNormalNC",
            Search = "None"
          }
        },
        zindex = 50
      }
        }
  end
}
