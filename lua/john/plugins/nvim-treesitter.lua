return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        -- context_commentstring = { enable = true, enable_autocmd = false },
        auto_install = true,
        ensure_installed = {
          -- "bash",
          "c",
          "html",
          "javascript",
          "json",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
          "rust",
          "go",
          "gomod",
          "gowork",
          "gosum",
          "java",
        },
        incremental_selection = {
          enable = false,
          keymaps = {
          },
        },
        textobjects = {
            lsp_interop = {
                enable = false,
                border = 'none',
                floating_preview_opts = {},
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer",
                },
            },
          select = {
            enable = false,
            lookahead = true,
            keymaps = {
            },
            selection_modes = {
            },
            include_surrounding_whitespace = false,
          },
          move = {
            enable = false,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_previous_start = {
            },
            goto_next_start = {
            },
          },
          swap = {
          },
        },
      }
    end
  },
}
