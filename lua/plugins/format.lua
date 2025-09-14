-- lua/config/options.lua or similar
return {
        {
                "LazyVim/LazyVim",
                opts = {
                        -- Configure format on save
                        format = {
                                timeout_ms = 3000,
                                async = false,
                                quiet = false,
                                lsp_format_on_save = true,
                        },
                },
        },
}
