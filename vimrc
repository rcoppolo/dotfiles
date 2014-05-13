" so ~/.vimrc.rcoppolo

if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround.git'
Bundle 'edsono/vim-matchit'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tomasr/molokai'
Bundle 'guns/vim-clojure-static'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'wting/rust.vim'
Bundle 'rcoppolo/vim-airline'
Bundle 'rcoppolo/aurelia'

let g:airline_theme='aurelia'
let g:airline_left_sep=''
let g:airline_right_sep=''

" The Basics
filetype plugin indent on
syntax on
set showmode
set autoindent
set showmatch
set ignorecase
set smartcase
set scrolloff=5
set history=50
set laststatus=2
set incsearch
set hlsearch
set nobackup
set nowritebackup
set noswapfile
set ruler
set number
set numberwidth=4
set backspace=indent,eol,start
set ttyfast
set showcmd
set wrap
set wildmenu
set modelines=0
set visualbell
set hidden
set gdefault

set clipboard=unnamed

set wrap
set textwidth=79
set formatoptions=qrn1

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

" add list lcs=tab:>-,trail:x for tab/trailing space visuals
autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent

"Save al buffers on loss of focus
:au FocusLost * silent! :wa

" Clear current search
nnoremap <silent> <leader><space> :noh<CR>

" Show registerj
nnoremap <silent> <leader>r :reg<CR>

" Essential maps
inoremap jk <ESC>
nnoremap ; :
nnoremap ;; ;
nnoremap k gk
nnoremap j gj
let mapleader = ","

" Split maps
nnoremap <leader>w :bel :vne<CR>
nnoremap <leader>e :bel :new<CR>

" Folding
" nnoremap zz zfip
nnoremap <space> za
vnoremap <space> zf

" Better searching
" nnoremap / /\v
" vnoremap / /\v

nnoremap <tab> %
vnoremap <tab> %

augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Quick yanking to the end of the line
nmap Y y$

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

" CtrlP
" let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_clear_cache_on_exit=0

" NERDTree
nnoremap <silent> <leader>q :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 24

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

if has("gui_running")
  set guioptions-=T
endif

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>ec :e ~/.vim/colors/aurelia.vim<CR>

" This here auto reloads vim after vimrc save
augroup myvimrc
  au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,aurelia.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

nmap <silent> ,n :call NumberToggle()<CR>

function! NumberToggle()
  if exists("&rnu")
    if &number
      setlocal nonumber
    elseif
      setlocal number
    endif
  endif
endfunction

nmap <silent> ,p :call Paste()<CR>
nmap <silent> ,o :call NoPaste()<CR>

function! Paste()
  setlocal paste
endfunction

function! NoPaste()
  setlocal nopaste
endfunction

set background=light
colorscheme aurelia
" colorscheme molokai
" let g:molokai_original = 1

" Highlights lines that are too long an ugly red color
" highlight OverLength ctermbg=red ctermfg=white guibg=#333333
" match OverLength /\%81v.\+/

" Strips all trailing whitespace in file
function! StripWhitespace ()
    exec ':silent! %s/\t/  /'
    exec ':silent! %s/ \+$//'
endfunction
map ,s :call StripWhitespace ()<CR>

" Improve syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.ss set filetype=javascript
au BufNewFile,BufRead *.ssp set filetype=html
au BufNewFile,BufRead *.dtl set filetype=html
au BufNewFile,BufRead *.eex set filetype=html
au BufRead,BufNewFile *.hamlc set ft=haml

" Format JSON shortcut
" need to: [sudo cpan JSON::XS] first
map <leader>j  <Esc>:%!json_xs -f json -t json-pretty<CR>

" map <leader>t :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <leader>t :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Resizing windows
nnoremap <S-h> <C-w><
nnoremap <S-j> <C-w>-
nnoremap <S-k> <C-w>+
nnoremap <S-l> <C-w>>

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <silent> <leader>f :call ToggleFocusMode()<CR>

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" trying new stuff
au VimResized * :wincmd =
nnoremap J mzJ`z

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

map N Nzz
map n nzz
