return {
  { "nvim-neotest/neotest-plenary" },
  { "haydenmeade/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = { "neotest-plenary", "neotest-jest" },
      defaults = {
        ["<leader>t"] = { name = "+test" },
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          if require("lazyvim.util").has("trouble.nvim") then
            vim.cmd("Trouble quickfix")
          else
            vim.cmd("copen")
          end
        end,
      },
    },
  },
}
