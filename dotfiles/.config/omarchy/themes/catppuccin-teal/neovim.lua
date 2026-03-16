return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      -- Updated for Variant 1 (Modern Teal 185°)
      color_overrides = {
        macchiato = {
          text = "#c0dce0",
          subtext1 = "#adcfd4",
          subtext0 = "#99bec4",
          overlay2 = "#88abb1",
          overlay1 = "#76979d",
          overlay0 = "#668388",
          surface2 = "#537075",
          surface1 = "#415c61",
          surface0 = "#2e484d",
          base = "#1e3236",
          mantle = "#182a2d",
          crust = "#111f22",
        },
      },
      custom_highlights = function(colors)
        -- Variant 1 Modern Teal Adaptations
        local teal = "#8bd5ca"     -- Primary Core
        local sky = "#91d7e3"      -- Secondary Core
        local text = "#c0dce0"     -- Neutral Text
        local subtext0 = "#99bec4" -- Neutral Subtext

        return {
          DashboardHeader = { fg = teal, bold = true },
          SnacksDashboardHeader = { fg = teal, bold = true },
          AlphaHeader = { fg = teal, bold = true },

          DashboardIcon = { fg = sky },
          SnacksDashboardIcon = { fg = sky },

          DashboardKey = { fg = teal },
          SnacksDashboardShortCut = { fg = teal },
          DashboardDesc = { fg = text },
          DashboardCenter = { fg = text },
          DashboardShortCut = { fg = teal },
          SnacksDashboardKey = { fg = teal },
          SnacksDashboardDesc = { fg = text },

          DashboardFooter = { fg = subtext0, italic = true },
          SnacksDashboardFooter = { fg = subtext0, italic = true },

          -- Additional dashboard text colors
          DashboardRecentFiles = { fg = text },
          DashboardProject = { fg = text },
          DashboardMruTitle = { fg = teal },
          DashboardFile = { fg = text },
          DashboardDir = { fg = subtext0 },
          DashboardButton = { fg = text },
          DashboardButtonIcon = { fg = sky },
          
          SnacksDashboardTitle = { fg = teal },
          SnacksDashboardFile = { fg = text },
          SnacksDashboardDir = { fg = subtext0 },
          SnacksDashboardButton = { fg = text },
          SnacksDashboardButtonIcon = { fg = sky },
          SnacksDashboardRecentFiles = { fg = text },
          SnacksDashboardProject = { fg = text },
          SnacksDashboardMruTitle = { fg = teal },
          
          AlphaButtons = { fg = text },
          AlphaShortcut = { fg = teal },
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