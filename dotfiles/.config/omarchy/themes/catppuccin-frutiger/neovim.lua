return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			custom_highlights = function(colors)
				return {
					DashboardHeader = { fg = colors.teal },
					SnacksDashboardHeader = { fg = colors.teal },
					AlphaHeader = { fg = colors.teal },
					DashboardIcon = { fg = colors.teal },
					SnacksDashboardIcon = { fg = colors.teal },
				}
			end,
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
