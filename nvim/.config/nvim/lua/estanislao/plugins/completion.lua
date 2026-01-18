return {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
        "saghen/blink.compat",
        -- "rafamadriz/friendly-snippets",
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },
        "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    -- use a release tag to download pre-built binaries
    version = "1.*",
    build = "cargo build --release",
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "enter",
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "select_next", "fallback_to_mappings" },
            ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-j>"] = { "select_next", "fallback_to_mappings" },
            ["<Tab>"] = {
                function (cmp)
                    if cmp.is_visible() then
                        return cmp.select_next()
                    elseif cmp.snippet_active() then
                        return cmp.snippet_forward()
                    end
                end,
                "fallback"
            },
            ["<S-Tab>"] = {
                function (cmp)
                    if cmp.is_visible() then
                        return cmp.select_prev()
                    elseif cmp.snippet_active() then
                        return cmp.snippet_backward()
                    end
                end,
                "fallback"
            }
        },

        cmdline = { enabled = true },
        appearance = {
            nerd_font_variant = "mono"
        },
        completion = {
            menu = { border = "rounded" },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = "rounded" }
            },
            accept = { auto_brackets = { enabled = true } },
            list = {
                selection = { preselect = true, auto_insert = false },
            },
            draw = {
                columns = { { "kind_icon" }, { "label", "label_description" }, gap = 1 },
            },
            ghost_text = { enabled = true },
        },
        snippets = { preset = 'luasnip' },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            providers = {
                tailwind = {
                    name = "tailwind",
                    module = "blink.compat.source",
                    score_offset = 100,
                },
                lsp = { score_offset = 90 }
            }
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        signature = { enabled = true }
    },
}
