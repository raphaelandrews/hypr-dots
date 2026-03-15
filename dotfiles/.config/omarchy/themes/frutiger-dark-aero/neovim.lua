return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        local aero_green = "#5CFF47"
        local aero_blue = "#0096FF"
        local glow_white = "#ECFFE0"

        return {
          DashboardHeader = { fg = aero_green, bold = true },
          SnacksDashboardHeader = { fg = aero_green, bold = true },
          AlphaHeader = { fg = aero_green, bold = true },
          
          DashboardIcon = { fg = aero_blue },
          SnacksDashboardIcon = { fg = aero_blue },
          
          DashboardKey = { fg = aero_green },
          SnacksDashboardShortCut = { fg = aero_green },
          DashboardDesc = { fg = glow_white },
          DashboardCenter = { fg = glow_white },
          DashboardShortCut = { fg = aero_green },
          SnacksDashboardKey = { fg = aero_green },
          SnacksDashboardDesc = { fg = glow_white },
          
          -- Dashboard Footer (Silver Glass)
          DashboardFooter = { fg = "#B4B4B4", italic = true },
          SnacksDashboardFooter = { fg = "#B4B4B4", italic = true },
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