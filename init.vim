call plug#begin('~/.vim/plugged')

" vim settings
" visual
set number
set relativenumber

" navigation
nnoremap <A-h> :tabprevious<CR>
nnoremap <A-l> :tabnext<CR>
:inoremap <C-b> <C-x><C-o>

" clipboard
set clipboard=unnamedplus

" Declare the list of plugins.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

function! OpenCompletion()
    if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
        call feedkeys("\<C-x>\<C-o>", "n")
    endif
endfunction

autocmd InsertCharPre *.go call OpenCompletion()
set completeopt+=menuone,noselect,noinsert

" Golang
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = 'goimports'
let g:go_highligh_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1


