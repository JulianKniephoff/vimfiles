source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#incubate()
call pathogen#helptags()

" Encoding
set encoding=utf-8

" Allow local configuration files
set exrc
set secure

" Allow for hidden files
set hidden

set incsearch
set hlsearch
" Generally ignore case while searching, but be smart when I do capitalize
set ignorecase
set smartcase

set autoindent
set tabstop=4
set shiftwidth=4
" Make spotting/differentiating of (unwanted) whitespace easy
set list
set listchars=tab:>\ 
call matchadd('ErrorMsg', '\s\+\%#\@<!$', -1)
autocmd WinEnter * call matchadd('ErrorMsg', '\s\+\%#\@<!$', -1)
autocmd InsertLeave * redraw!

set textwidth=79
if exists('+colorcolumn')
	set colorcolumn=+1
else
	function! ToggleLongLines()
		if exists('w:LongLineMatch')
			call matchdelete(w:LongLineMatch)
			unlet w:LongLineMatch
		elseif &textwidth > 0
			let w:LongLineMatch = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1)
		else
			let w:LongLineMatch = matchadd('ErrorMsg', '\%>80v.\+', -1)
		endif
	endfunction

	call ToggleLongLines()
	nmap <Leader>8 :call ToggleLongLines()<CR>
endif

" Number lines
set number

" Let me look ahead while scrolling
set scrolloff=3
" Remember cursor position between editing sessions
autocmd BufReadPost * call RestoreCursorPosition()
function! RestoreCursorPosition()
	if line("'\"") > 0 && line("'\"") <= line("$")
		normal! `"
		normal! zz
		" TODO Maybe rather also restore viewport position?
	endif
endfunction

filetype plugin on
filetype indent on
syntax on
au BufRead,BufNewFile *.jstalk set filetype=javascript
au BufRead,BufNewFile *.as set filetype=actionscript
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.m set filetype=objc
au BufRead,BufNewFile *.mm set filetype=objcpp
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile Thorfile set filetype=ruby

set background=dark
colorscheme solarized

" Allow me to circumvent AutoClose
inoremap <leader>" "
inoremap <leader>' '
inoremap <leader>( (
inoremap <leader>) )
inoremap <leader>[ [
inoremap <leader>] ]
inoremap <leader>{ {
inoremap <leader>} }

" Other mappings
source <sfile>:h/keymap.vim

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Make top match of CommandT not move
let g:CommandTMatchWindowAtTop=1

let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf='Skim'
