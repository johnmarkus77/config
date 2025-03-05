vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  },
  config = function()
    local function on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      update_focused_file = {
        enable = true,
      },
      trash = {
        cmd = "trash"
      },
      filters = {
        custom = { ".DS_Store" },
        dotfiles = true,
      },
      view = {
        width = vim.o.columns,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              -- Your folder icons here, if any
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = true,  -- This is the key setting to close the tree when opening a file
        },
      },
      git = {
        ignore = false,
      },
    })
  end,
}
