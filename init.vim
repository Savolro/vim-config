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
set colorcolumn=100
set textwidth=100

" Declare the list of plugins.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'andythigpen/nvim-coverage'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set completeopt+=menuone,noselect,noinsert
" " Merging stuff
nnoremap <A-o> :diffget LO<CR>
nnoremap <A-p> :diffget RE<CR>

" Coc additions
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd CursorHold call CocActionAsync('showSignatureHelp')
nnoremap gd :call CocActionAsync('jumpDefinition')<CR>
nnoremap gr :call CocActionAsync('jumpReferences')<CR>

" Code coverage
lua require("coverage").setup()
hi SignColumn ctermbg=Black
hi CoverageCovered ctermfg=Green
hi CoverageUncovered ctermfg=Red
hi CoveragePartial ctermfg=Yellow
command Cov execute "CoverageLoad" | execute "CoverageShow"

" Golang
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1

" Dart
let g:dart_highlight_types = 1

autocmd BufWritePre *.go :silent! call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :silent! call CocAction('format')

" Personal color modifications
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
hi CocMenuSel ctermbg=8
hi Visual ctermbg=8 ctermfg=none
hi StatusLineNC ctermbg=15 ctermfg=0
hi ColorColumn ctermbg=Yellow

hi CocInlayHint ctermfg=7 cterm=italic

" This is not really safe to use
function UpdateModifiedDate(filePath)
	silent! execute '!sed -Ei "s/modified: [0-9]*-[0-9]*-[0-9]*T[0-9]*:[0-9]*:[0-9]*\+[0-9]*:[0-9]*/modified: $(date +\%Y-\%m-\%dT\%T\%:z)/g" ' a:filePath
	edit
endfunction

autocmd BufWritePost ~/dev/stuff/notes/*.md :call UpdateModifiedDate(@%)

autocmd BufNewFile ~/dev/stuff/notes/todo/*.md, :0read !echo "---";
	\echo "created: $(date +\%Y-\%m-\%dT\%T\%:z)";
	\echo "modified: $(date +\%Y-\%m-\%dT\%T\%:z)";
	\echo "type: Checklist";
	\echo "---";
	\echo "";
	\echo "\#" %:t:r;

autocmd BufNewFile ~/dev/stuff/notes/work/*.md,~/dev/stuff/notes/home/*.md,~/dev/stuff/work/*.md :0read !echo "---";
	\echo "created: $(date +\%Y-\%m-\%dT\%T\%:z)";
	\echo "modified: $(date +\%Y-\%m-\%dT\%T\%:z)";
	\echo "---";
	\echo "";
	\echo "\#" %:t:r;

autocmd BufNewFile ~/dev/stuff/notes/journal/*.md :0read !echo "---";
	\echo "created: $(date +\%Y-\%m-\%dT\%T\%:z)";
	\echo "modified: $(date +\%Y-\%m-\%dT\%T\%:z)";
	\echo "type: Journal";
	\echo "---";
	\echo "";
	\echo "\#" %:t:r;

" note autoupdate
autocmd BufReadPre ~/dev/stuff/notes/* :silent! execute '!git pull &'
autocmd BufWritePost ~/dev/stuff/notes/* :silent! execute '!git add .; git commit -m "update %:."; git push &'
autocmd VimEnter ~/dev/stuff/notes :silent! execute '!git pull &'

" Environment variables
let $CARGO_TARGET_DIR = '.vim/target'
set notermguicolors

