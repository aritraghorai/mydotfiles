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
    },
  },
}
