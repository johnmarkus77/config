return { 
    {
        'nvim-telescope/telescope.nvim',branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            local builtin = require('telescope.builtin')

            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "<leader>gg", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

            vim.keymap.set('n', '<leader>f', builtin.find_files, {})
            vim.keymap.set('n', '<leader>sa', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>b', builtin.buffers, {})
            -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            -- vim.keymap.set('n', '<leader>gt', builtin.git_status, {})
            -- vim.keymap.set('n', '<leader>ta', builtin.current_buffer_fuzzy_find, {})
            -- vim.keymap.set('n', '<leader>so', builtin.oldfiles, {})
            -- vim.keymap.set('n', '<leader>tt', builtin.resume, {})

            local telescope = require('telescope')

            telescope.setup {
                defaults = {
                    file_ignore_patterns = { "%.git/.", "node_modules", },
                    previewer = false,
                    -- hidden = true,
                    prompt_prefix = "   ",
                    initial_mode = "insert",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.75,
                            results_width = 0.95,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.9,
                        height = 0.80,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    },
                    smart_open = {
                        show_scores = false,
                        match_algorithm = "fzy",
                        disable_devicons = false,
                        open_buffer_indicators = {previous = "👀", others = "🙈"},
                    }
                },
                pickers = {
                    find_files = {
                        -- theme = "dropdown",
                        previewer = true,
                        layout_config = {
                            horizontal = {
                                prompt_position = "top",
                                preview_width = 0.45,
                                results_width = 0.80,
                            },
                            vertical = {
                                mirror = false,
                            },
                            width = 0.9,
                            height = 0.95,
                            prompt_position = "top",
                            preview_cutoff = 120,
                        },
                    },
                    git_files = {
                        previewer = true,
                        layout_config = {
                            height = 0.8,
                            prompt_position = "top",
                            preview_cutoff = 120,
                        },
                    },
                    buffers = {
                        previewer = false,
                        initial_mode = "insert",
                        theme = "dropdown",
                        layout_config = {
                            width = 0.75,
                            height = 0.4,
                            prompt_position = "top",
                            preview_cutoff = 120,
                        },
                        mappings = {
                            n = {
                                ['<c-d>'] = require('telescope.actions').delete_buffer
                            }, -- n
                            i = {
                                ['<c-d>'] = require('telescope.actions').delete_buffer
                            } -- i
                        }, -- mappings
                    },
                    current_buffer_fuzzy_find = {
                        previewer = true,
                        -- theme = "dropdown",
                        layout_config = {
                            width = 0.9,
                            height = 0.95,
                            prompt_position = "top",
                            --preview_cutoff = 120,
                            preview_width = 0.55
                        },
                    },
                    live_grep = {
                        only_sort_text = true,
                        previewer = true,
                        layout_config = {
                            horizontal = {
                                width = 0.9,
                                height = 0.95,
                                preview_width = 0.6,
                            },
                        },
                    },
                    grep_string = {
                        only_sort_text = true,
                        previewer = true,
                        layout_config = {
                            horizontal = {
                                width = 0.9,
                                height = 0.95,
                                preview_width = 0.6,
                            },
                        },
                    },
                    lsp_references = {
                        show_line = false,
                        previewer = true,
                        layout_config = {
                            horizontal = {
                                width = 0.9,
                                height = 0.75,
                                preview_width = 0.6,
                            },
                        },
                    },
                    treesitter = {
                        show_line = false,
                        previewer = true,
                        layout_config = {
                            horizontal = {
                                width = 0.9,
                                height = 0.75,
                                preview_width = 0.6,
                            },
                        },
                    },
                },
            }

            telescope.load_extension("fzf")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup ({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}

