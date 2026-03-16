return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      -- Ensure the base palette follows the 165° botanical hue
      color_overrides = {
        macchiato = {
          text = "#c0e0d6",
          subtext1 = "#add4c5",
          subtext0 = "#99c4b3",
          overlay2 = "#88b19e",
          overlay1 = "#76978a",
          overlay0 = "#668878",
          surface2 = "#537566",
          surface1 = "#416154",
          surface0 = "#2e4d40",
          base = "#1e362c",
          mantle = "#182d24",
          crust = "#11221b",
        },
      },
      custom_highlights = function(colors)
        -- Variant 3 Botanical Adaptations
        local green = "#a6da95"    -- Primary Core
        local yellow = "#eed49f"   -- Tertiary/Warning
        local text = "#c0e0d6"     -- Neutral Text
        local subtext0 = "#99c4b3" -- Neutral Subtext

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

          -- Additional dashboard text colors
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