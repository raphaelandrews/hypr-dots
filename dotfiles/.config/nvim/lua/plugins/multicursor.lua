return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    -- Add cursors above/below the main cursor
    vim.keymap.set({ "n", "v" }, "<C-Up>", function()
      mc.addCursor("k")
    end, { desc = "Add cursor above" })
    vim.keymap.set({ "n", "v" }, "<C-Down>", function()
      mc.addCursor("j")
    end, { desc = "Add cursor below" })

    -- Add a cursor and jump to the next word under cursor
    vim.keymap.set({ "n", "v" }, "<C-n>", function()
      mc.addCursor("*")
    end, { desc = "Add cursor on next match" })

    -- Jump to the next word under cursor but do not add a cursor
    vim.keymap.set({ "n", "v" }, "<C-s>", function()
      mc.skipCursor("*")
    end, { desc = "Skip to next match" })

    -- Rotate the main cursor
    vim.keymap.set({ "n", "v" }, "<C-Left>", mc.nextCursor, { desc = "Next cursor" })
    vim.keymap.set({ "n", "v" }, "<C-Right>", mc.prevCursor, { desc = "Previous cursor" })

    -- Delete the main cursor
    vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor, { desc = "Delete cursor" })

    -- Clear all cursors
    vim.keymap.set({ "n", "v" }, "<Esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <Esc> handler
      end
    end, { desc = "Clear cursors" })

    -- Align cursor columns
    vim.keymap.set("n", "<leader>a", mc.alignCursors, { desc = "Align cursors" })

    -- Split visual selections by regex
    vim.keymap.set("v", "S", mc.splitCursors, { desc = "Split cursors by regex" })

    -- Append/insert for each line of visual selections
    vim.keymap.set("v", "I", mc.insertVisual, { desc = "Insert at start of visual lines" })
    vim.keymap.set("v", "A", mc.appendVisual, { desc = "Append at end of visual lines" })

    -- Match new cursors within visual selections by regex
    vim.keymap.set("v", "M", mc.matchCursors, { desc = "Match cursors by regex" })

    -- Rotate visual selection contents
    vim.keymap.set("v", "<leader>t", function()
      mc.transposeCursors(1)
    end, { desc = "Transpose cursors forward" })
    vim.keymap.set("v", "<leader>T", function()
      mc.transposeCursors(-1)
    end, { desc = "Transpose cursors backward" })

    -- Customize how cursors look
    vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
  end,
}
