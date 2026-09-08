-- Resolve the real (non-shim) Java 21 home/executable from mise, so JDTLS and the
-- Spring Boot language server always run on the project's target JDK even when
-- Java 27 is also installed. `mise where` returns the install dir (e.g.
-- .../installs/java/21.0.2) which contains bin/java.
local function java21()
  local home = vim.fn.trim(vim.fn.system({ "mise", "where", "java@21" }))
  if home == "" then -- fall back to the active default in case java@21 is unresolved
    home = vim.fn.trim(vim.fn.system({ "mise", "where", "java" }))
  end
  if home ~= "" and vim.fn.filereadable(home .. "/bin/java") == 1 then
    return home
  end
  return nil
end

local java_home = java21() -- nil when not resolvable
local java_exec = java_home and (java_home .. "/bin/java") or ""

return {
  { import = "lazyvim.plugins.extras.lang.java" },

  {
    "mfussenegger/nvim-jdtls",
    -- Load spring-boot.nvim before nvim-jdtls's config runs, so that
    -- require("spring_boot") succeeds when the jdtls bundles are built
    -- (avoids the STS4-extension load-order race).
    dependencies = { "JavaHello/spring-boot.nvim" },
    opts = {
      jdtls = function(opts)
        -- Lombok is already passed as -javaagent by the official extra.

        -- Explicit Java 21 runtime + code quality defaults. Because JDTLS is
        -- launched *on* this JVM, Java 21 becomes the default project VM too
        -- (compliance is still read from the project's pom.xml).
        local settings = {
          java = {
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            -- Keep the language server away from build/test output and VCS state.
            import = {
              exclusions = {
                "**/target/**",
                "**/build/**",
                "**/.git/**",
                "**/node_modules/**",
              },
            },
            -- Parameter-name inlay hints trigger a Neovim 0.12 bug
            -- ("Invalid 'col': out of range") after JDTLS edits the buffer
            -- (e.g. Generate hashCode/equals). Keep them off.
            inlayHints = {
              parameterNames = { enabled = "none" },
            },
          },
        }
        if java_home then
          settings.java.home = java_home
          settings.java.configuration = {
            runtimes = {
              { name = "JavaSE-21", path = java_home, default = true },
            },
          }
        end
        opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, settings)

        -- Pass an explicit real Java 21 to the jdtls launcher. Otherwise it
        -- resolves `java` to the mise shim, and mason's jdtls.py does
        -- os.execvp(java, exec_args) with the JVM flags as argv[0], which
        -- makes mise fail with "is not a valid shim" and exit code 1.
        if java_exec ~= "" and vim.fn.filereadable(java_exec) == 1 then
          opts.cmd = opts.cmd or {}
          vim.list_extend(opts.cmd, { "--java-executable", java_exec })
        end

        -- Add Spring Boot's JDT extension jars to the same bundles list that
        -- already contains java-debug-adapter + java-test (from the extra).
        local ok, spring_boot = pcall(require, "spring_boot")
        if ok then
          opts.init_options = opts.init_options or {}
          opts.init_options.bundles = opts.init_options.bundles or {}
          vim.list_extend(opts.init_options.bundles, spring_boot.java_extensions())
        end
      end,
    },
  },

  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    opts = {
      -- Run the Spring Boot language server on Java 21 as well.
      java_cmd = java_exec ~= "" and java_exec or nil,
    },
    config = function(_, opts)
      require("spring_boot").setup(opts)
    end,
  },
}
