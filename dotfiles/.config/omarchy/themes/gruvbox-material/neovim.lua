return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      overrides = {
        -- 🌿 STRUCTURE (top)
        DashboardHeader = { fg = "#A9B665", bold = true },

        -- 🪶 NEUTRALS
        DashboardIcon = { fg = "#A89984" },
        DashboardDesc = { fg = "#928374" },
        DashboardFiles = { fg = "#928374" },
        DashboardCenter = { fg = "#928374" },

        -- 🌞 INTERACTION (middle)
        DashboardKey = { fg = "#D8A657", bold = true },

        -- 🔥 ACCENT (actions / shortcuts)
        DashboardShortCut = { fg = "#E78A4E" },
        DashboardShortcut = { fg = "#E78A4E" },

        -- 🌿 SECTION TITLES
        DashboardMruTitle = { fg = "#A9B665", bold = true },
        DashboardProjectTitle = { fg = "#A9B665", bold = true },

        -- 🪶 ICONS
        DashboardMruIcon = { fg = "#A89984" },
        DashboardProjectIcon = { fg = "#A89984" },
        DashboardShortCutIcon = { fg = "#A89984" },

        -- 🔥 FOOTER (closure)
        DashboardFooter = { fg = "#E78A4E", italic = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}