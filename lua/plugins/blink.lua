return {
    { "L3MON4D3/LuaSnip", keys = {} },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            -- removed supermaven-inc/supermaven-nvim
            -- removed huijiro/blink-cmp-supermaven
        },
        version = "*",
        config = function()
            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "lazydev", "buffer" },
                    providers = {
                        lsp = {
                            timeout_ms = 500, -- Don't wait too long for LSP
                        },
                        lazydev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                        snippets = {
                            min_keyword_length = 2,
                            score_offset = 5, -- Prioritize snippets slightly
                        },
                        cmdline = {
                            min_keyword_length = 2,
                        },
                    },
                },
                keymap = {
                    ["<C-f>"] = {},
                },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<CR>"] = { "accept_and_enter", "fallback" },
                    },
                },
                completion = {
                    trigger = {
                        show_on_insert_on_trigger_character = true,
                    },
                    list = {
                        selection = {
                            preselect = true,
                            auto_insert = true,
                        },
                    },
                    accept = {
                        auto_brackets = {
                            enabled = true,
                        },
                    },
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label", "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 200,
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()

            -- Load HTML snippets for Vue, React, and Blade files
            local luasnip = require("luasnip")
            luasnip.filetype_extend("vue", { "html", "javascript", "css" })
            luasnip.filetype_extend("javascriptreact", { "html", "javascript" })
            luasnip.filetype_extend("typescriptreact", { "html", "typescript" })
            luasnip.filetype_extend("blade", { "html", "php" })
        end,
    },
}

