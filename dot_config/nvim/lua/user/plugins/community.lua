return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.remote-development.distant-nvim" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.rose-pine", opts = { colorscheme = "rose-pine" } },
  {
    "ahmedkhalf/project.nvim",
    opts = {},
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension "projects"
    end,
    keys = {
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
      { "<C-p>", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    },
  },
}
