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
set background=dark
set laststatus=2
set cursorline
set pastetoggle=<F2>
set undofile                
set undodir=$HOME/.vim/undo 
set undoreload=10000
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

colorscheme monokai
highlight Search ctermbg=white ctermfg=black cterm=underline
hi CursorLine   cterm=NONE ctermbg=235


if $FileType!='gitcommit'
  set foldmethod=syntax
  set foldlevelstart=1
  set foldenable
endif

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

let @j = '^/@iV/\8€kb*\/<nhx/\/*€kb\*\*'
let @u = '^f{va}dF:xxj'

let mapleader = "\<Space>"

:command WQ wq
:command Wq wq
:command W w
:command Wa wa
:command WA wa
:command Q q
:command Qa qa
:command QA qa

nmap ; :
nnoremap <F3> ::lcd %:p:h<Enter>:tabe explorer<Enter>:Explo<Enter>
nnoremap <F4> :set relativenumber!<Enter>
nnoremap <F8> <C-x>
nnoremap <F9> <C-a>
nnoremap <F12> :set spell!<Enter>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>r :w<Enter>:! cargo run<Enter>
nnoremap <Leader>n :lnext<Enter>
nnoremap c mic
nnoremap i mii

inoremap jk <Esc>
inoremap jh <Esc>`i
inoremap ji <Esc>:w<Enter>
" surround  shortcuts wrap word in ' "
imap j' <Esc>lcsw'i
imap j" <Esc>lcsw"i

:iabbrev adn and
:iabbrev schmea schema
:iabbrev Schmea Schema
:iabbrev sectoin section
:iabbrev Sectoin Section

au BufReadPost *.sass set syntax=sass
au BufReadPost *.es6 set syntax=javascript
let javaScript_fold=0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:rustfmt_autosave = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

execute pathogen#infect()
filetype plugin indent on

