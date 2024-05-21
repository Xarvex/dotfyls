return {
    "nvim-treesitter/nvim-treesitter",
    event = { "User BufNewFileFiltered", "User BufReadPostFiltered", "User BufWritePreFiltered" },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "rust",
                "go",
                "c",
                "cpp",
                "java",
                "kotlin",
                "javascript",
                "typescript",
                "lua",
                "python",
                "bash",
                "html",
                "css"
            },
            ignore_install = {},
            modules = {},
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false
            },
            indent = { enable = true },
            auto_install = true,
            sync_install = false
        })
    end
}
