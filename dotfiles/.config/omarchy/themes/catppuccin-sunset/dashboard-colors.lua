return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local cp = require("catppuccin.palettes").get_palette("macchiato")

      -- Warm tones from Catppuccin Macchiato
      local warm = {
        rosewater = cp.rosewater,
        flamingo  = cp.flamingo,
        pink      = cp.pink,
        peach     = cp.peach,
        maroon    = cp.maroon,
        mauve    = cp.mauve,
        yellow    = cp.yellow,
        teal    = cp.teal,
      }

      -- Override Alpha highlight groups
      opts.section.header.opts.hl = "AlphaHeader"
      opts.section.buttons.opts.hl = "AlphaButtons"
      opts.section.footer.opts.hl = "AlphaFooter"

      vim.api.nvim_set_hl(0, "AlphaHeader",  { fg = warm.peach })
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = warm.rosewater })
      vim.api.nvim_set_hl(0, "AlphaFooter",  { fg = warm.pink })

      -- Keybind hints (the letters on the right)
      vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = warm.teal })

      return opts
    end,
  },
}
