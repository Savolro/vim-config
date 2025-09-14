-- Add to lua/plugins/lualine.lua
return {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
                -- Custom theme using only terminal colors (0-15)
                opts.options.theme = {
                        normal = {
                                a = { bg = 4, fg = 15 }, -- Blue background, White text
                                b = { bg = 8, fg = 15 }, -- Gray background, White text
                                c = { bg = 0, fg = 7 }, -- Black background, Light gray text
                        },
                        insert = {
                                a = { bg = 2, fg = 0 }, -- Green background, Black text
                        },
                        visual = {
                                a = { bg = 5, fg = 15 }, -- Magenta background, White text
                        },
                        replace = {
                                a = { bg = 1, fg = 15 }, -- Red background, White text
                        },
                        command = {
                                a = { bg = 3, fg = 0 }, -- Yellow background, Black text
                        },
                        inactive = {
                                a = { bg = 0, fg = 8 }, -- Black background, Gray text
                                b = { bg = 0, fg = 8 },
                                c = { bg = 0, fg = 8 },
                        },
                }

                return opts
        end,
}
