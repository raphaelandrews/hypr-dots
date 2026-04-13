return {
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			overrides = {
				DashboardHeader = { fg = "#8ec07c", bold = true }, -- bright_aqua
				DashboardIcon = { fg = "#a89984" }, -- light4 (neutral)
				DashboardDesc = { fg = "#bdae93" }, -- light3 (neutral)
				DashboardKey = { fg = "#fe8019", bold = true }, -- bright_orange
				DashboardFooter = { fg = "#b8bb26", italic = true }, -- bright_green
				DashboardMruTitle = { fg = "#8ec07c", bold = true },
				DashboardProjectTitle = { fg = "#8ec07c", bold = true },
				DashboardMruIcon = { fg = "#a89984" }, -- neutral
				DashboardProjectIcon = { fg = "#a89984" }, -- neutral
				DashboardFiles = { fg = "#bdae93" }, -- light3 (neutral)
				DashboardShortCut = { fg = "#fe8019" },
				DashboardShortCutIcon = { fg = "#a89984" }, -- neutral
				-- doom theme fallbacks
				DashboardCenter = { fg = "#bdae93" },
				DashboardShortcut = { fg = "#fe8019" },
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
