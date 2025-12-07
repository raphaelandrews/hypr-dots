return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      custom_highlights = function(colors)
        return {
          -- Warm accents
          CursorLine = { bg = colors.surface1 },
          LineNr = { fg = colors.maroon },
          CursorLineNr = { fg = colors.peach, bold = true },

          Visual = { bg = colors.surface2 },

          -- LSP
          DiagnosticError = { fg = colors.maroon },
          DiagnosticWarn = { fg = colors.peach },
          DiagnosticInfo = { fg = colors.flamingo },
          DiagnosticHint = { fg = colors.rosewater },

          -- Git
          GitSignsAdd = { fg = colors.peach },
          GitSignsChange = { fg = colors.flamingo },
          GitSignsDelete = { fg = colors.maroon },

          -- UI
          FloatBorder = { fg = colors.peach },
          NeoTreeDirectoryName = { fg = colors.peach },
          NeoTreeDirectoryIcon = { fg = colors.rosewater },

          -- Telescope
          TelescopeBorder = { fg = colors.peach },
          TelescopeSelection = { bg = colors.surface1 },
          TelescopeMatching = { fg = colors.rosewater, bold = true },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
