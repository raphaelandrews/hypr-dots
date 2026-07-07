return {
  -- Roslyn LSP (replaces omnisharp, includes Razor/CSHTML via co-hosting)
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    init = function()
      vim.filetype.add({
        extension = {
          razor = "razor",
          cshtml = "razor",
        },
      })
      vim.lsp.config("roslyn", {
        settings = {
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "openFiles",
          },
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
            dotnet_enable_tests_code_lens = true,
          },
          ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
        },
      })
    end,
    opts = {},
  },

  -- .NET utilities: auto DLL picker, helpers, Razor outline
  {
    "ramboe/ramboe-dotnet-utils",
    event = "VeryLazy",
  },

  -- Mason: dotnet toolchain (roslyn, netcoredbg, csharpier, xmlformatter)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      }
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "csharpier", "xmlformatter" })
    end,
  },

  -- Conform: csharpier + xmlformat formatters
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.cs = { "csharpier" }
      opts.formatters_by_ft.csproj = { "xmlformat" }
      opts.formatters_by_ft.xml = { "xmlformat" }
      opts.formatters = opts.formatters or {}
      opts.formatters.csharpier = {
        command = "csharpier",
        args = { "format", "--write-stdout" },
        to_stdin = true,
      }
      opts.formatters.xmlformat = {
        command = "xmlformat",
      }
    end,
  },

  -- nvim-dap: netcoredbg debugger with auto DLL detection
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"

      dap.adapters.coreclr = {
        type = "executable",
        command = mason_path,
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return require("dap-dll-autopicker").build_dll_path()
          end,
        },
      }
    end,
  },

  -- neotest: dotnet test adapter
  {
    "Issafalcon/neotest-dotnet",
    lazy = true,
    ft = { "cs" },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "Issafalcon/neotest-dotnet" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      opts.adapters["neotest-dotnet"] = {}
    end,
  },
}
