return {
  {
    "nvim-neotest/neotest",
    -- ft = { "go", "rust", "python", "javascript", "typescript", "java" },
    dependencies = {
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      "haydenmeade/neotest-jest",
      "andy-bell101/neotest-java",
      {
        "folke/neodev.nvim",
        opts = function(_, opts)
          opts.library = opts.library or {}
          if opts.library.plugins ~= true then
            opts.library.plugins = require("astronvim.utils").list_insert_unique(opts.library.plugins, "neotest")
          end
          opts.library.types = true
        end,
      },
    },
    opts = function()
      return {
        log_level = vim.log.levels.TRACE,

        -- your neotest config here
        adapters = {
          require "neotest-go",
          require "neotest-rust",
          require "neotest-python",
          require "neotest-jest",
          require "neotest-java" {
            -- function to determine which runner to use based on project path
            determine_runner = function(project_root_path)
              -- return should be "maven" or "gradle"
              return "maven"
            end,
            -- override the builtin runner discovery behaviour to always use given
            -- tool. Default is "nil", so no override
            force_runner = nil,
            -- if the automatic runner discovery can't uniquely determine whether
            -- to use Gradle or Maven, fallback to using this runner. Default is
            -- "gradle"
            fallback_runner = "maven",
          },
        },
      }
    end,
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup(opts)
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run File" },
      { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      {
        "<leader>to",
        function() require("neotest").output.open { enter = true, auto_close = true } end,
        desc = "Show Output",
      },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { neotest = true } },
  },
}
