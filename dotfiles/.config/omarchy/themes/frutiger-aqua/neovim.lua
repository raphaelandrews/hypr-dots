return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        local green = "#5CFF47"
        local yellow = "#FFD700"
        local text = "#ECFFE0"
        local subtext0 = "#A4C4A4"

        return {
          DashboardHeader = { fg = green, bold = true },
          SnacksDashboardHeader = { fg = green, bold = true },
          AlphaHeader = { fg = green, bold = true },

          DashboardIcon = { fg = yellow },
          SnacksDashboardIcon = { fg = yellow },

          DashboardKey = { fg = green },
          SnacksDashboardShortCut = { fg = green },
          DashboardDesc = { fg = text },
          DashboardCenter = { fg = text },
          DashboardShortCut = { fg = green },
          SnacksDashboardKey = { fg = green },
          SnacksDashboardDesc = { fg = text },

          DashboardFooter = { fg = subtext0, italic = true },
          SnacksDashboardFooter = { fg = subtext0, italic = true },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}