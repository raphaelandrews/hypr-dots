return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c_sharp",
        "razor",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
        "bash",
      },
      highlight = { enable = true },
    },
    init = function()
      vim.treesitter.language.register("bash", "conf")
      vim.treesitter.language.register("bash", "kitty")
      vim.treesitter.language.register("bash", "tmux")
      vim.treesitter.language.register("bash", "sh")
    end,
  },
}
