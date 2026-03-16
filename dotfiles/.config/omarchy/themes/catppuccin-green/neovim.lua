return {
  {
    "Ferouk/bearded-nvim",
    name = "bearded",
    priority = 1000,
    config = function()
      -- 1. Setup the theme flavor
      require("bearded").setup({
        flavor = "oceanic",
      })
      vim.cmd("colorscheme bearded")

      -- 2. Define Variant 3 Botanical Palette
      local green = "#a6da95"
      local teal = "#8bd5ca"
      local yellow = "#eed49f"
      local peach = "#f5a97f"
      local text = "#c0e0d6"
      local subtext0 = "#99c4b3"

      -- 3. Map EVERY property from your long list
      local hl = vim.api.nvim_set_hl
      local highlights = {
        -- Headers
        DashboardHeader = { fg = green, bold = true },
        SnacksDashboardHeader = { fg = green, bold = true },
        AlphaHeader = { fg = green, bold = true },

        -- Icons
        DashboardIcon = { fg = yellow },
        SnacksDashboardIcon = { fg = yellow },
        DashboardButtonIcon = { fg = yellow },
        SnacksDashboardButtonIcon = { fg = yellow },

        -- Keys & Shortcuts
        DashboardKey = { fg = peach },
        DashboardShortCut = { fg = peach },
        SnacksDashboardKey = { fg = peach },
        SnacksDashboardShortCut = { fg = peach },
        AlphaShortcut = { fg = peach },

        -- Descriptions & Text
        DashboardDesc = { fg = text },
        DashboardCenter = { fg = text },
        DashboardRecentFiles = { fg = text },
        DashboardProject = { fg = text },
        DashboardFile = { fg = text },
        DashboardButton = { fg = text },
        AlphaButtons = { fg = text },
        SnacksDashboardDesc = { fg = text },
        SnacksDashboardFile = { fg = text },
        SnacksDashboardButton = { fg = text },
        SnacksDashboardRecentFiles = { fg = text },
        SnacksDashboardProject = { fg = text },

        -- Titles
        DashboardMruTitle = { fg = green },
        SnacksDashboardTitle = { fg = green },
        SnacksDashboardMruTitle = { fg = green },

        -- Footers & Directories
        DashboardFooter = { fg = yellow, italic = true },
        SnacksDashboardFooter = { fg = yellow, italic = true },
        AlphaFooter = { fg = yellow, italic = true },
        DashboardDir = { fg = yellow },
        SnacksDashboardDir = { fg = yellow },
      }

      -- 4. The Loop: This is what applies the "long list"
      for group, opts in pairs(highlights) do
        hl(0, group, opts)
      end
      
      -- 5. Force Transparency (Optional but recommended for your build)
      hl(0, "Normal", { bg = "NONE" })
      hl(0, "NormalFloat", { bg = "NONE" })
    end,
  }
}