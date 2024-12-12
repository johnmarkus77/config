vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.colorcolumn = "100"

vim.o.ls = 0  
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Allow undotree to have access to long running undos (Can undo things from days ago)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.fillchars = { eob = ' ' }
vim.opt.cursorline = true

vim.opt.textwidth = 80

vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Smart dd function
local function smart_dd()
    if vim.api.nvim_get_current_line():match("^%s*$") then
        return '"_dd'
    else
        return "dd"
    end
end

-- Set up the keymapping
vim.keymap.set('n', 'dd', smart_dd, { expr = true })


-- Define custom highlight group with light grey background
vim.api.nvim_set_hl(0, 'YankHighlight', { bg = '#4e4945' })

-- Use the custom group in the autocommand
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = 'YankHighlight', timeout = 200 }
  end,
})
