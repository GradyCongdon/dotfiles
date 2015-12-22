syntax on
set t_ut=
set relativenumber
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2
set autoindent
set smartindent
set smarttab
set nowrap
set linebreak
set wildmenu
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set showmatch
set mat=2
colorscheme molokai
set background=dark
set laststatus=2
set cursorline
highlight Search ctermbg=black ctermfg=white cterm=underline
nmap <Space> i
nmap ; :
nnoremap <F8> <C-x>
nnoremap <F9> <C-a>
nnoremap <F3> :set spell!<Enter>
nnoremap <F4> :set relativenumber!<Enter>
nnoremap <Space>j o<Esc>
nnoremap <Space>k O<Esc>
nnoremap <Space>' `
nnoremap c mic
nnoremap i mii
inoremap jk <Esc>
inoremap jh <Esc>`i
inoremap ji <Esc>:w<Enter>
" surround  shortcuts wrap word in ' "
imap j' <Esc>lcsw'i
imap j" <Esc>lcsw"i
au BufReadPost *.less set syntax=css
set pastetoggle=<F2>
set undofile                
set undodir=$HOME/.vim/undo 
set undoreload=10000
execute pathogen#infect()
filetype plugin indent on

