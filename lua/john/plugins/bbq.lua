-- Helo
return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("barbecue").setup({
            theme = {
                normal = { fg = "#dbaf7b", bold = false },
                basename = { bold = false },
            },
         attach_navic = false,
        })
    end,
}
