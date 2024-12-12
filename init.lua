require("john.core")
require("john.lazy")

-- Define custom highlight group with light grey background
vim.api.nvim_set_hl(0, 'YankHighlight', { bg = '#4e4945' })

-- Use the custom group in the autocommand
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = 'YankHighlight', timeout = 200 }
  end,
})

