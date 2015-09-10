execute pathogen#infect()
nnoremap ; :
nnoremap : ;
set nu
set wildmode=longest,list,full
set wildmenu
set backspace=2
set nowrap
set  t_Co=256
set splitright
filetype plugin on
set omnifunc=syntaxcomplete#Complete
inoremap <leader><Tab> <C-x><C-o>
inoremap <leader>c <C-x><C-L>
func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  set formatprg=par
  setlocal wrap
  setlocal linebreak
endfu
com! WP call WordProcessorMode()
noremap <leader>g :grep -nr
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

syntax enable
set background=dark
colorscheme solarized