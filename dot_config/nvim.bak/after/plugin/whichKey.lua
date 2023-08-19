local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true,         -- shows a list of your marks on ' and `
        registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+",      -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 },                                           -- min and max height of the columns
        width = { min = 20, max = 50 },                                           -- min and max width of the columns
        spacing = 3,                                                              -- spacing between columns
        align = "left",                                                           -- align columns left, center or right
    },
    ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                             -- show help message on the command line when the popup is visible
    triggers = "auto",                                                            -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    ["b"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers",
    },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["q"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["f"] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
    },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    ["T"] = { "<cmd>Telescope find_files<cr>", "Open Telescope" },
    ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    l = {
        name = "LSP",
        d = {
            "<cmd>Telescope diagnostics<cr>",
            "Document Diagnostics",
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>Lspsaga rename<CR>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
    },

    --For coc keyset
    -- l = {
    -- 	r = { "<Plug>(coc-rename)", "Renames" },
    -- 	a = { "<Plug>(coc-codeaction-selected)", "Code Action" },
    -- 	A = { "<Plug>(coc-codeaction)", "Code Action Current Buffere" },
    -- 	f = { "<Plug>(coc-fix-current)", "Fixed Current Code" },
    -- 	d = { "<cmd>Telescope coc diagnostic<cr>", "Show All DiagnosticSignError" },
    -- 	S = { "<cmd>Telescope coc code_action<cr>", "Show All CocActionAsync" },
    -- },

    s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
    t = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        --   t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
    m = {
        name = "markdown preview",
        p = { "<cmd>MarkdownPreview<cr>", "MarkdownPreview" },
        s = { "<cmd>MarkdownPreviewStop<cr>", "Stop MarkdownPreview" },
        t = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle MarkdownPreview" },
    },
    g = {
        name = "git",
        b = { "<cmd>Telescope git_branches<cr>", "Show All Git Branches" },
        o = { "<cmd>Telescope git_commits<cr>", "Show All Git Commits" },
        c = { "<cmd>:Git push -u origin HEAD<CR>", "Added a commit" },
        p = { "<cmd>::Git push -u origin HEAD<CR>", "Push All Changes" },

    },
}
-- local j = {
--     name = "Code",
--     o = { "<cmd>lua require'jdtls'.organize_imports()<cr>", "Organize Imports" },
--     v = { "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract Variable" },
--     c = { "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract Constant" },
--     t = { "<cmd>lua require('jdtls').test_class()<cr>", "Test Class" },
--     n = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Nearest Method" },
-- }
-- local J = {
--     name = "Code",
--     v = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
--     c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
--     m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
-- }
-- if vim.bo.filetype == "java" then
--     mappings.j = j
--     mappings.J = J
-- end

which_key.setup(setup)
which_key.register(mappings, opts)
