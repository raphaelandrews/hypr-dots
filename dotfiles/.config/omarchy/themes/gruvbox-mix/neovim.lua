return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      overrides = {
        -- 🌿 STRUCTURE (top)
        DashboardHeader = { fg = "#B0B846", bold = true },

        -- 🪶 NEUTRALS
        DashboardIcon = { fg = "#A89984" },
        DashboardDesc = { fg = "#928374" },
        DashboardFiles = { fg = "#928374" },
        DashboardCenter = { fg = "#928374" },

        -- 🌞 INTERACTION (middle)
        DashboardKey = { fg = "#E9B143", bold = true },

        -- 🔥 ACCENT (actions / shortcuts)
        DashboardShortCut = { fg = "#F28534" },
        DashboardShortcut = { fg = "#F28534" },

        -- 🌿 SECTION TITLES
        DashboardMruTitle = { fg = "#B0B846", bold = true },
        DashboardProjectTitle = { fg = "#B0B846", bold = true },

        -- 🪶 ICONS
        DashboardMruIcon = { fg = "#A89984" },
        DashboardProjectIcon = { fg = "#A89984" },
        DashboardShortCutIcon = { fg = "#A89984" },

        -- 🔥 FOOTER (closure)
        DashboardFooter = { fg = "#F28534", italic = true },
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