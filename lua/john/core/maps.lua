vim.g.mapleader = " "

-- Move visual mode selected lines up/down using J/K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumps get centered
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<Down>", "<C-d>zz")
vim.keymap.set("n", "<Up>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- foo
-- bar
-- copy foo, highlight bar, leader + p, won't lose foo.
-- vim.keymap.set("n", "Q", "<nop>")

-- Redo Map
vim.keymap.set("n", "U", "<C-R>", { desc = "Redo last change" })

-- UndoTree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- Fast saving
vim.keymap.set("n", "<leader>w", ":write!<CR>", opts)

-- Copy all
vim.keymap.set('n', '<leader>cc', 'ggVG', opts);

--vim.keymap.set("n", ":", "<cmd>Telescope resume<cr>", opts)

-- Move windows


vim.keymap.set("n", "\\", ":split<CR>", { desc = "Open new split horizontally", silent = true })
vim.keymap.set("n", "|", ":vsplit<CR>", { desc = "Open new split vertically", silent = true })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Clear /search highlight
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true });


-- Terminal window navigation key mappings
vim.api.nvim_set_keymap('t', '<C-n>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', {noremap = true})


-- Copy to system clipboar
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })

-- Reformat
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })

vim.api.nvim_set_keymap('n', ':', ';', { noremap = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('x', ':', ';', { noremap = true })
vim.api.nvim_set_keymap('x', ';', ':', { noremap = true })

-- Use delete key to switch between last buffers quckly.
vim.keymap.set("n", "<BS>", ":b#<CR>", { silent=true })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { silent=true })

vim.keymap.set("n", "_", ":vertical resize -5<CR>")
vim.keymap.set("n", "+", ":vertical resize +5<CR>")
--vim.keymap.set("n", "=", ":resize +5<CR>")
--vim.keymap.set("n", "-", ":resize -5<CR>")
local opts = { noremap = true, silent = true }

-- Navigate buffers
vim.keymap.set("n", "<Right>", ":bnext<CR>", opts)
vim.keymap.set("n", "<Left>", ":bprevious<CR>", opts)
-- local keymap = vim.keymap -- for conciseness

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory"})

vim.api.nvim_set_keymap('n', '<F6>', 'gg=G', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
        vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
            silent = true,
            buffer = true,
        })
    end,
})

vim.api.nvim_set_keymap('i', '<space>', '<C-G>u<space>', { noremap = true, silent = true })

