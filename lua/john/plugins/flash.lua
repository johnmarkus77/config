return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
            search = {
                mode = function(str)
                    local case_flag = str:match("%u") and "\\C" or "\\c"
                    return case_flag .. "\\<" .. str
                end,
            },
            modes = {
                char = {
                    enabled = true ,
                    -- dynamic configuration for ftFT motions
                    config = function(opts)
                        -- autohide flash when in operator-pending mode
                        opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

                        -- disable jump labels when not enabled, when using a count,
                        -- or when recording/executing registers
                        opts.jump_labels = opts.jump_labels
                        and vim.v.count == 0
                        and vim.fn.reg_executing() == ""
                        and vim.fn.reg_recording() == ""

                        -- Show jump labels only in operator-pending mode
                        -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
                    end,
                    -- hide after jump when not using jump labels
                    autohide = false,
                    -- show jump labels
                    jump_labels = false,
                    -- set to `false` to use the current line only
                    multi_line = false,
                    -- When using jump labels, don't use these keys
                    -- This allows using those keys directly after the motion
                    label = { exclude = "hjkliardc" },
                    -- by default all keymaps are enabled, but you can disable some of them,
                    -- by removing them from the list.
                    -- If you rather use another key, you can map them
                    -- to something else, e.g., { [";"] = "L", [","] = H }
                    keys = { "f", "F", "t", "T", ";", "," },
                    ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
                    -- The direction for `prev` and `next` is determined by the motion.
                    -- `left` and `right` are always left and right.
                    char_actions = function(motion)
                        return {
                            [";"] = "next", -- set to `right` to always go right
                            [","] = "prev", -- set to `left` to always go left
                            -- clever-f style
                            [motion:lower()] = "next",
                            [motion:upper()] = "prev",
                            -- jump2d style: same case goes next, opposite case goes prev
                            -- [motion] = "next",
                            -- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
                        }
                    end,
                    search = { wrap = false },
                    highlight = { backdrop = false },
                    jump = {
                        register = false,
                        -- when using jump labels, set to 'true' to automatically jump
                        -- or execute a motion when there is only one match
                        autojump = false,
                    },
                },
                search = {
                    case_sensitive = false,
                },
            },
            label = {
                uppercase = false;
            },
        },
        keys = {
            { "<leader><leader>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "<leader>ss", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        },
    }
}
