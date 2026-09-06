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
        -- JDK runtimes are omitted until the project JDK is chosen: this
        -- system uses mise, not /usr/lib/jvm.
        opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
          java = {
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
          },
        })

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
    opts = {},
    config = function(_, opts)
      require("spring_boot").setup(opts)
    end,
  },
}
