" Setup for new machine:
" git clone git@github.com:gmarik/vundle.git
" and put in ~/.vim/bundle
" then start vim and go: :BundleInstall

" so ~/.vimrc.rcoppolo

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
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-surround.git'
Bundle 'wavded/vim-stylus'
Bundle 'digitaltoad/vim-jade'
Bundle 'tomasr/molokai'

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

set wrap
set textwidth=79
set formatoptions=qrn1

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
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>e <C-w>s<C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Folding
nnoremap zz zfip
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
" set list listchars=tab:»·,trail:·

" Quick yanking to the end of the line
nmap Y y$

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

" CtrlP
nmap <c-p> :CtrlPMRUFiles<CR>

" NERDTree
nnoremap <silent> <leader>q :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeDirArrows=0

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Improve syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

if has("gui_running")
  set guioptions-=T
endif

nmap <silent> <leader>ev :e $MYVIMRC<CR>

" This here auto reloads vim after vimrc save
augroup myvimrc
  au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

nmap <silent> ,n :call NumberToggle()<CR>

function! NumberToggle()
  if exists("&rnu")
    if &number
      setlocal relativenumber
    else
      setlocal number
    endif
  endif
endfunction

set background=light
colorscheme molokai
let g:molokai_original = 1

au BufRead,BufNewFile *.hamlc set ft=haml

" Highlights lines that are too long an ugly red color
highlight OverLength ctermbg=red ctermfg=white guibg=#333333
match OverLength /\%81v.\+/

" Strips all trailing whitespace in file
function! StripWhitespace ()
    exec ':silent! %s/\t/  /'
    exec ':silent! %s/ \+$//'
endfunction
map ,s :call StripWhitespace ()<CR>
