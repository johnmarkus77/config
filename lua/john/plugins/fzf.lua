return
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization

            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true }

            -- Leader ss to do fzf live grep
            -- keymap('n', '<leader>gg', "<cmd>lua require('fzf-lua').live_grep()<CR>", opts)
            require("fzf-lua").setup({})
        end
    }
