local builtin = require('telescope.builtin')
local J = {
    name = "Code",
    v = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
    c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
    m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
}
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
