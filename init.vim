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
set colorcolumn=72

" Declare the list of plugins.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set completeopt+=menuone,noselect,noinsert

" Coc additions
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd CursorHold call CocActionAsync('showSignatureHelp')
nnoremap gd :call CocActionAsync('jumpDefinition')<CR>
nnoremap gr :call CocActionAsync('jumpReferences')<CR>

" Golang
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

let g:dart_highlight_types = 1

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre * :silent call CocAction('format')

function ColorToANSI(color)
	if a:color == 81
		return 14
	elseif a:color == 159
		return 14
	elseif a:color == 121
		return 10
	elseif a:color == 225
		return 13
	elseif a:color == 224
		return 13
	elseif a:color == 242
		return 8
	elseif a:color == 248
		return 7
	else
		return a:color
endfunction

" Use only ANSI colors
function ForceANSI()
	redir => output
	silent exec "hi"
	redir END
	let lines = split(output, "\n")
	for line in lines
		let ctermfg_entry = matchstr(line, "ctermfg\=[0-9]*")
		let ctermbg_entry = matchstr(line, "ctermbg\=[0-9]*")
		let changed = "false"
		let key = split(line)[0]
		for setting in ["ctermfg", "ctermbg"]
			let entry = matchstr(line, setting . "\=[0-9]*")
			if entry != ""
				let val = split(entry, "=")[1]
				let new_val = ColorToANSI(val)
				if new_val > 15
					echo "WARNING: non ANSI color '" . new_val . "' is used for '" . key . "' "
				endif
				if val != new_val
					execute 'hi' key setting . "=" . new_val 
				endif
			endif
		endfor
		if changed == "true"
		endif
	endfor
endfunction

call ForceANSI()

" Personal color modifications
hi Pmenu ctermbg=8 ctermfg=15
hi PmenuSel ctermbg=12 ctermfg=0
hi ErrorMsg ctermbg=0 ctermfg=1
hi Error ctermbg=0 ctermfg=1
hi Search ctermbg=1 ctermfg=0

" note autoupdate
autocmd BufWritePost ~/dev/stuff/notes/* :!git add .; git commit -m "update %:."; git push &
autocmd VimEnter ~/dev/stuff/notes :!git pull &
