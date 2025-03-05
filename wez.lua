-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.keys = {
    {
        key = 'LeftArrow',
        mods = 'CMD',
        action = wezterm.action { SendString = "\x1bOH" },
    },
    {
        key = 'RightArrow',
        mods = 'CMD',
        action = wezterm.action { SendString = "\x1bOF" },
    },
    {
        key = 'Backspace',
        mods = 'CMD',
        action = wezterm.action { SendKey = { key = 'u', mods = 'CTRL' } }, -- Equivalent to clearing line in many shells
    },
    {
        key = 'Backspace',
        mods = 'ALT',
        action = wezterm.action { SendString = "\x1b\x7f" }, -- Send the sequence for deleting a word back
    },
}

-- Apply config choices
config.default_cursor_style = 'SteadyBlock'
config.window_close_confirmation = 'AlwaysPrompt'

config.font_size = 19
config.font = wezterm.font("FiraMono Nerd Font Mono")
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.automatically_reload_config = true




config.window_padding = {
    left = 0,
    right = 0,
    top = 5,
    bottom = 0,
}
-- -- Return the configuration
-- local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
-- modal.apply_to_config(config)


config.line_height = 1.35
config.colors = {
    background = "#282828", -- Override the background color
}
config.color_scheme = 'Gruvbox dark, medium (base16)'
return config


