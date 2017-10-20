filetype plugin on
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
set splitbelow
set splitright

let mapleader = "\<Space>"

colorscheme monokai
highlight Search ctermbg=white ctermfg=black cterm=underline
hi CursorLine   cterm=NONE ctermbg=235

let @j = '^/@iV/\8€kb*\/<nhx/\/*€kb\*\*'
let @u = '^f{va}dF:xxj'
"space out {{abc}} to {{ abc }}
let @s = ':%s/{\([%{]\)\([^ ]\)/{\1 \2/g:%s/\([^ ]\)\([%}]\)}/\1 \2}/g'


:command WQ wq
:command Wq wq
:command W w
:command Wa wa
:command WA wa
:command Q q
:command Qa qa
:command QA qa
:command Tabe tabe

nmap ; :
nnoremap <F2> ::lcd %:p:h<Enter>:tabe explorer<Enter>:Explo<Enter>
nnoremap <F3> ::lcd %:p:h<Enter>:tabe explorer<Enter>:Explo<Enter>
nnoremap <F4> :set relativenumber!<Enter>
nnoremap <F5> ::lcd ~/www/automagick/src/app<Enter>:tabe explorer<Enter>:Explo<Enter>
nnoremap <F8> <C-x>
nnoremap <F9> <C-a>
nnoremap <F12> :set spell!<Enter>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>r :w<Enter>:! cargo run<Enter>
nnoremap <Leader>n :lnext<Enter>
nnoremap c mic
nnoremap i mii
" Split pane movement "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
:iabbrev resposne response
:iabbrev evalute evaluate
:iabbrev jounral journal
:iabbrev calss class

" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

if $FileType!='gitcommit'
  set foldmethod=syntax
  set foldlevelstart=1
  set foldenable
endif

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

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

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
"nmap <Leader>s <Plug>(easymotion-overwin-f)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" no quote hiding: vim-json https://github.com/elzr/vim-json
let g:vim_json_syntax_conceal = 0
" flow syntastic + eslint
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_javascript_flow_exe = 'flow'
let g:syntastic_ignore_files = ['node_modules', '**/node_modules/*']

let g:syntastic_typescript_tsc_args = "--target ES2015 --experimentalDecorators --moduleResolution 'Node'"

execute pathogen#infect()
filetype plugin indent on
