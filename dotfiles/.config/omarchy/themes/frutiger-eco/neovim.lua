return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        local aero_green = "#5CFF47"
        local vista_blue = "#5CFF47"
        local ice_white = "#E0FBFF"

        return {
          DashboardHeader = { fg = aero_green, bold = true },
          SnacksDashboardHeader = { fg = aero_green, bold = true },
          AlphaHeader = { fg = aero_green, bold = true },
          
          DashboardIcon = { fg = aero_green },
          SnacksDashboardIcon = { fg = aero_green },
          
          DashboardKey = { fg = aero_green },
          DashboardDesc = { fg = ice_white },
          DashboardCenter = { fg = ice_white },
          DashboardShortCut = { fg = aero_green },
          SnacksDashboardKey = { fg = aero_green },
          SnacksDashboardDesc = { fg = ice_white },
          
          -- Dashboard Footer (Mist Blue)
          DashboardFooter = { fg = "#BDE0FE", italic = true },
          SnacksDashboardFooter = { fg = "#BDE0FE", italic = true },
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