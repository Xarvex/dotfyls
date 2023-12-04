return {
    {
        "zaldih/themery.nvim",
        cmd = "Themery",
        keys = {
            { "<C-A-t>", vim.cmd.Themery }
        },
        opts = {
            themes = {
                "oxocarbon",
                "carbonfox",
                "tokyonight",
                "rose-pine"
            },
            themeConfigFile = vim.fn.stdpath("config") .. "/lua/generated/theme.lua"
        }
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        opts = {
            variant = "main",
            dark_variant = "main",
            disable_background = true,
            disable_float_background = true,
            disable_italics = true
        }
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        opts = { options = { transparent = true } }
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = true
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "night",
            transparent = true,
            terminal_colors = true,
            styles = {
                keywords = { italic = false },
                sidebars = "transparent",
                floats = "transparent"
            },
            hide_inactive_statusline = false,
            dim_inactive = false,
            lualine_bold = false
        }
    }
}
