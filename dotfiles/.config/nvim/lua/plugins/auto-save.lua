return {
  "pocco81/auto-save.nvim",
  event = "VeryLazy",
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function()
          return ("💾 Saved at " .. os.date("%H:%M:%S"))
        end,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.expand("%:t"), {}) then
          return true
        end
        return false
      end,
    })
  end,
}
