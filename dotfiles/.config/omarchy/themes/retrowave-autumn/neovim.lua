local function setup_vaporwave()
  vim.opt.termguicolors = true

  local C = {
    bg = "#08131a",
    bg_alt = "#050c11",
    fg = "#dbe6ff",
    muted = "#acb8d6",

    blue = "#1abcdd",
    blue2 = "#027b9b",
    teal = "#50a3b5",
    yellow = "#fba02f",
    orange = "#ff5a33",
    purple = "#b499ff",
    pink = "#ff80c4",

    cyan = "#68d3f0",
    border = "#50a3b5",

    hover = "#1e4862",
    active = "#2d6870",
    inactive = "#0f2838",

    error = "#ff5a33",
    warn = "#fba02f",
    info = "#68d3f0",
    hint = "#50a3b5",
  }

  local hl = vim.api.nvim_set_hl

  -------------------------------------------------------
  -- Core UI
  -------------------------------------------------------
  hl(0, "Normal", { fg = C.fg, bg = C.bg })
  hl(0, "NormalNC", { fg = C.muted, bg = C.bg })
  hl(0, "Visual", { bg = C.hover })
  hl(0, "CursorLine", { bg = C.inactive })
  hl(0, "CursorLineNr", { fg = C.yellow, bold = true })
  hl(0, "LineNr", { fg = C.muted })
  hl(0, "Search", { fg = C.bg, bg = C.pink })
  hl(0, "IncSearch", { fg = C.bg, bg = C.purple })

  -------------------------------------------------------
  -- Floats
  -------------------------------------------------------
  hl(0, "NormalFloat", { fg = C.fg, bg = C.bg_alt })
  hl(0, "FloatBorder", { fg = C.border, bg = C.bg_alt })
  hl(0, "FloatTitle", { fg = C.yellow, bold = true })

  -------------------------------------------------------
  -- Diagnostics
  -------------------------------------------------------
  hl(0, "DiagnosticError", { fg = C.error })
  hl(0, "DiagnosticWarn", { fg = C.warn })
  hl(0, "DiagnosticInfo", { fg = C.info })
  hl(0, "DiagnosticHint", { fg = C.hint })
  for _, kind in ipairs({ "Error", "Warn", "Info", "Hint" }) do
    hl(0, "DiagnosticUnderline" .. kind, {
      sp = C[string.lower(kind)],
      undercurl = true,
    })
  end

  -------------------------------------------------------
  -- Git
  -------------------------------------------------------
  hl(0, "GitSignsAdd", { fg = C.teal })
  hl(0, "GitSignsChange", { fg = C.yellow })
  hl(0, "GitSignsDelete", { fg = C.error })

  -------------------------------------------------------
  -- Telescope
  -------------------------------------------------------
  hl(0, "TelescopeNormal", { fg = C.fg, bg = C.bg_alt })
  hl(0, "TelescopeBorder", { fg = C.border, bg = C.bg_alt })
  hl(0, "TelescopeSelection", { bg = C.hover })
  hl(0, "TelescopeMatching", { fg = C.blue, bold = true })

  -------------------------------------------------------
  -- Cmp
  -------------------------------------------------------
  hl(0, "Pmenu", { bg = C.bg_alt, fg = C.fg })
  hl(0, "PmenuSel", { bg = C.active, fg = C.bg })
  hl(0, "PmenuThumb", { bg = C.border })

  -------------------------------------------------------
  -- Neo-tree / NvimTree
  -------------------------------------------------------
  hl(0, "NeoTreeNormal", { fg = C.fg, bg = C.bg })
  hl(0, "NeoTreeNormalNC", { fg = C.muted, bg = C.bg })
  hl(0, "NeoTreeDirectoryIcon", { fg = C.blue })
  hl(0, "NeoTreeDirectoryName", { fg = C.fg })
  hl(0, "NeoTreeGitModified", { fg = C.yellow })
  hl(0, "NeoTreeGitDeleted", { fg = C.error })
  hl(0, "NeoTreeGitAdded", { fg = C.teal })
  hl(0, "NeoTreeIndentMarker", { fg = C.muted })

  -------------------------------------------------------
  -- Bufferline
  -------------------------------------------------------
  hl(0, "BufferLineFill", { bg = C.bg })
  hl(0, "BufferLineBackground", { bg = C.bg, fg = C.muted })
  hl(0, "BufferLineBufferSelected", { fg = C.fg, bg = C.active, bold = true })
  hl(0, "BufferLineSeparatorSelected", { fg = C.active })
  hl(0, "BufferLineModifiedSelected", { fg = C.yellow })

  -------------------------------------------------------
  -- Treesitter
  -------------------------------------------------------
  hl(0, "@function", { fg = C.blue })
  hl(0, "@variable", { fg = C.purple })
  hl(0, "@keyword", { fg = C.pink })
  hl(0, "@string", { fg = C.teal })
  hl(0, "@type", { fg = C.cyan })
  hl(0, "@constant", { fg = C.orange })

  -------------------------------------------------------
  -- Notify / Noice
  -------------------------------------------------------
  for level, col in pairs({
    ERROR = C.error,
    WARN = C.warn,
    INFO = C.info,
    DEBUG = C.purple,
    TRACE = C.cyan,
  }) do
    hl(0, "Notify" .. level .. "Border", { fg = col })
    hl(0, "Notify" .. level .. "Title", { fg = col })
  end

  -------------------------------------------------------
  -- Which-key
  -------------------------------------------------------
  hl(0, "WhichKey", { fg = C.blue })
  hl(0, "WhichKeyGroup", { fg = C.yellow })
  hl(0, "WhichKeyDesc", { fg = C.fg })
  hl(0, "WhichKeyFloat", { bg = C.bg_alt })

  -------------------------------------------------------
  -- Indent-Blankline
  -------------------------------------------------------
  hl(0, "IblIndent", { fg = C.inactive })
  hl(0, "IblScope", { fg = C.teal })

  -------------------------------------------------------
  -- Alpha / Dashboard
  -------------------------------------------------------

  hl(0, "AlphaHeader", { fg = C.pink, bold = true })
  hl(0, "AlphaButtons", { fg = "#7df9ff" })
  hl(0, "AlphaShortcut", { fg = C.yellow })
  hl(0, "AlphaFooter", { fg = C.fg, italic = true })
  -------------------------------------------------------
  -- Statusline (Lualine)
  -------------------------------------------------------
  hl(0, "StatusLine", { fg = C.fg, bg = C.bg_alt })
  hl(0, "StatusLineNC", { fg = C.muted, bg = C.bg })
  hl(0, "StatusLineAccent", { fg = C.yellow, bold = true })
  hl(0, "StatusLineSeparator", { fg = C.border })
end

setup_vaporwave()

return {}
