-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Ported from the old pre-quattro bindings.conf (no longer sourced).

-- Activity / btop (default binds Activity to SUPER+CTRL+T)
o.bind("SUPER + SHIFT + T", "Activity (btop)", "omarchy-launch-tui btop")

-- Screenshot area
o.bind("SHIFT + ALT + S", "Screenshot area", "omarchy-capture-screenshot region")

-- Special character typing
o.bind("SHIFT + ALT + W", "Question mark", 'wtype "?"')
o.bind("SHIFT + ALT + Q", "Slash", 'wtype "/"')
o.bind("SHIFT + ALT + D", "Degree", 'wtype "°"')
o.bind("SHIFT + ALT + O", "Ordinal", 'wtype "º"')
o.bind("SHIFT + ALT + Z", "Pipe", 'wtype "|"')

-- SUPER+SHIFT+E was Email (preinstalled webapp); now opens yazi.
hl.unbind("SUPER + SHIFT + E")
o.bind("SUPER + SHIFT + E", "Yazi", "omarchy-launch-tui yazi")
