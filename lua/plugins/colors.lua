return {
        {
                "LazyVim/LazyVim",
                opts = {
                        -- don't let LazyVim load a colorscheme
                        colorscheme = function() end,
                },
                init = function()
                        -- Set your global variables here
                        vim.g.go_highlight_build_constraints = 1
                        vim.g.go_highlight_extra_types = 1
                        vim.g.go_highlight_fields = 1
                        vim.g.go_highlight_functions = 1
                        vim.g.go_highlight_function_calls = 1
                        vim.g.go_highlight_operators = 1
                        vim.g.go_highlight_types = 1
                        vim.g.go_highlight_function_parameters = 1
                        vim.g.go_highlight_array_whitespace_error = 1
                        vim.g.go_highlight_space_tab_error = 1
                        vim.g.go_highlight_trailing_whitespace_error = 1
                        vim.g.go_highlight_format_strings = 1
                        vim.opt.termguicolors = false

                        vim.cmd([[
  hi Pmenu ctermbg=15 ctermfg=0
  hi PmenuSel ctermbg=8 ctermfg=15
  hi PmenuSbar ctermbg=8
  hi PmenuThumb ctermbg=7
  hi ErrorMsg ctermbg=0 ctermfg=1
  hi Error ctermbg=0 ctermfg=1
  hi Keyword ctermfg=11
  hi Number ctermfg=10
  hi Comment ctermfg=7
  hi Todo ctermfg=11
  hi Function ctermfg=5 cterm=bold
  hi CursorLineNr ctermfg=11 cterm=none
  hi CursorLine ctermbg=8 cterm=none
  hi Operator ctermfg=11
  hi Identifier ctermfg=14 cterm=bold
  hi Type ctermfg=10
  hi Statement ctermfg=11 cterm=none
  hi String ctermfg=13
  hi Search ctermbg=7 ctermfg=0
  hi CurSearch ctermbg=7 ctermfg=0
  hi Visual ctermbg=8 ctermfg=none
  hi StatusLineNC ctermbg=15 ctermfg=0
  hi ColorColumn ctermbg=Yellow
  hi TabLine ctermbg=0 ctermfg=15
  hi BufferLineBufferSelected ctermfg=11 cterm=italic
]])
                end,
        },
}
