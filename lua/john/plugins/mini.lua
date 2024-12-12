return {
    {
        'echasnovski/mini.ai',
        'echasnovski/mini.comment',

        version = '*',
        config = function()
            require('mini.ai').setup({})
        end,
    },
    {
        'echasnovski/mini.comment',
        version = '*',
        config = function()
            require('mini.comment').setup({})
        end,
    }
}
