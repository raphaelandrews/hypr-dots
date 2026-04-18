return {
  -- Extras (already in lazy.lua but explicit here for clarity)
  -- { import = "lazyvim.plugins.extras.lang.python" },

  -- Pyright: strict type checking
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- Stop at pyrightconfig.json/pyproject.toml, not .git (fixes monorepo venv detection)
          root_dir = require("lspconfig.util").root_pattern("pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg"),
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "standard", -- "off" | "basic" | "standard" | "strict"
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                autoImportCompletions = true,
              },
            },
          },
        },
      },
    },
  },

  -- Ruff: linting + formatting (replaces black + isort + flake8)
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      -- none-ls not needed if using conform + nvim-lint directly
    end,
  },

  -- conform.nvim: use ruff for formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
      },
    },
  },

  -- nvim-lint: ruff only (mypy removed — SQLModel has poor mypy support, pyright handles types)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
      },
    },
  },

  -- Mason: ensure tools installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "debugpy",
      },
    },
  },

  -- venv-selector: pick virtualenv
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },

  -- neotest: pytest runner
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-python" },
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
          python = function()
            -- use active venv python if available
            local venv = vim.fn.getenv("VIRTUAL_ENV")
            if venv ~= vim.NIL and venv ~= "" then
              return venv .. "/bin/python"
            end
            return "python3"
          end,
        },
      },
    },
  },

  -- DAP: python debugger
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      local debugpy_path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(debugpy_path .. "/venv/bin/python")
    end,
  },
}
