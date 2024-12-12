return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        require("treesitter-context").setup()

        vim.api.nvim_exec([[
            hi TreesitterContext guibg=none
            hi TreesitterContextLineNumber guibg=none
            hi TreesitterContextSeparator guibg=none
            hi TreesitterContextBottom gui=none guisp=Grey
        ]], false)
    end,

}
