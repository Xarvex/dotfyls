return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim"
    },
    event = { "CmdlineEnter", "InsertEnter" },
    config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_cmp()

        local cmp = require("cmp")

        cmp.setup({
            entries = { name = "custom", selection_order = "near_cursor" },
            formatting = { format = require("lspkind").cmp_format() },
            mapping = {
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<CR>"] = cmp.mapping({
                    i = function(fallback)
                        local opts

                        if cmp.visible() then
                            if #cmp.get_entries() == 1 then
                                opts = { select = true }
                            elseif cmp.get_selected_entry() then
                                opts = { select = false, behavior = cmp.ConfirmBehavior.Replace }
                            end
                        end

                        if opts then cmp.confirm(opts) else fallback() end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                }),
            }
        })
    end
}
