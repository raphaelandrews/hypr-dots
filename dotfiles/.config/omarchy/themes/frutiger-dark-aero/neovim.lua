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

          -- Additional dashboard text colors to override catppuccin purple
          DashboardRecentFiles = { fg = text },
          DashboardProject = { fg = text },
          DashboardMruTitle = { fg = green },
          DashboardFile = { fg = text },
          DashboardDir = { fg = subtext0 },
          DashboardButton = { fg = text },
          DashboardButtonIcon = { fg = yellow },
          
          SnacksDashboardTitle = { fg = green },
          SnacksDashboardFile = { fg = text },
          SnacksDashboardDir = { fg = subtext0 },
          SnacksDashboardButton = { fg = text },
          SnacksDashboardButtonIcon = { fg = yellow },
          SnacksDashboardRecentFiles = { fg = text },
          SnacksDashboardProject = { fg = text },
          SnacksDashboardMruTitle = { fg = green },
          
          AlphaButtons = { fg = text },
          AlphaShortcut = { fg = green },
          AlphaFooter = { fg = subtext0, italic = true },
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