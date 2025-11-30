return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "moon",
      transparent = false,
      on_colors = function(colors)
        -- Base background & foreground
        colors.bg = "#1A1824"        
        colors.bg_dark = "#2A2035"
        colors.bg_highlight = "#47436A" 
        colors.bg_statusline = "#1A1824"
        colors.bg_popup = "#1A1824"
        colors.bg_sidebar = "#2A2035"
        colors.bg_float = "#2A2035"
        colors.terminal_black = "#2A2035"

        colors.fg = "#BDCBEF"      
        colors.fg_dark = "#B9B3D9"    
        colors.fg_gutter = "#B9B3D9"   
        colors.comment = "#B9B3D9"

        -- Accent colors
        colors.blue = "#6ADED7"       
        colors.cyan = "#6ADED7"
        colors.magenta = "#FD76B6"     
        colors.purple = "#A895FF"     
        colors.orange = "#F4CE71"    
        colors.red = "#FF5A6A" 
      end,
      on_highlights = function(hl, colors)
        -- WhichKey popup
        hl.WhichKeyNormal = { bg = colors.bg_dark }
        hl.WhichKeyFloat = { bg = colors.bg_dark }
        hl.WhichKeyBorder = { bg = colors.bg_dark, fg = colors.bg_highlight }

        -- Statusline / Lualine
        hl.StatusLine = { bg = colors.bg_dark, fg = colors.fg }
        hl.StatusLineNC = { bg = colors.bg_dark, fg = colors.fg_dark }

        hl.lualine_a_normal = { bg = colors.bg_highlight, fg = colors.fg }
        hl.lualine_b_normal = { bg = colors.bg_dark, fg = colors.fg }
        hl.lualine_c_normal = { bg = colors.bg_dark, fg = colors.fg_dark }

        -- Snazzy picker highlights
        local bg = colors.bg
        vim.api.nvim_set_hl(0, "SnacksPicker", { bg = bg })
        vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = bg })
        vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = bg })
        vim.api.nvim_set_hl(0, "SnacksPickerPrompt", { bg = bg })

        -- Optional: highlight active line / selection with your accent
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2A2035" })
        vim.api.nvim_set_hl(0, "Visual", { bg = "#47436A" })
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight-moon")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon",
    },
  },
}