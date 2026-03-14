return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        local vista_blue = "#0096FF"
        local sapphire_cyan = "#00D4FF"
        local ice_white = "#E0FBFF"

        return {
          DashboardHeader = { fg = vista_blue, bold = true },
          SnacksDashboardHeader = { fg = vista_blue, bold = true },
          AlphaHeader = { fg = vista_blue, bold = true },
          
          DashboardIcon = { fg = sapphire_cyan },
          SnacksDashboardIcon = { fg = sapphire_cyan },
          
          DashboardKey = { fg = sapphire_cyan },
          DashboardDesc = { fg = ice_white },
          SnacksDashboardKey = { fg = sapphire_cyan },
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