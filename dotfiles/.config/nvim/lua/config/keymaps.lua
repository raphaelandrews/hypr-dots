-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Ergonomic mappings
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("n", "<S-Tab>", "<cmd>b#<CR>", { desc = "Previous buffer" })

-- Yank diagnostic
vim.keymap.set("n", "<leader>yc", function()
  local d = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if d and d[1] then
    vim.fn.setreg("+", d[1].message)
    vim.notify("Diagnostic copied")
  else
    vim.notify("No diagnostic here", vim.log.levels.WARN)
  end
end, { desc = "Yank diagnostic" })

-- ramboe-dotnet-utils helpers (lazy-loaded, require on first use)
vim.keymap.set("n", "<leader>aa", function()
  require("helpers").HighlightCSharpMethod()
end, { desc = "Highlight C# method" })
vim.keymap.set("n", "<leader>co", function()
  require("helpers").CloseOtherBuffers()
end, { desc = "Close other buffers" })
