return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "lunarvim/Onedarker.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
  },
  {
    "rose-pine/neovim",
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      colorscheme = "tokyonight",
      style = "night",
    },

    -- opts = {
    --   transparent = true,
    --   styles = {
    --     sidebars = "transparent",
    --     floats = "transparent",
    --   },
    -- },
  },
  {},
}
