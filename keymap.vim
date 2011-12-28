" I hate leftover highlighting
nnoremap // :noh<CR>
noremap <Leader>/ :FufLine<CR>

" Some often used combinations
noremap E ea

" Correct capitalization in insert mode
inoremap ~~ <Esc>mzb~`za
" Correct double capitalization
inoremap ~~~ <Esc>mzbl~`za

" Quickly exit insert mode
inoremap jk <Esc>

" Quickly save
noremap <C-S> :w<CR>
