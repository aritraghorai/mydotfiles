return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>gb",
        function()
          require("telescope.builtin").git_branches()
        end,
        desc = "Find git branch",
      },
      {
        "<c-p>",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Find All Files in it",
      },
    },
  },
}
