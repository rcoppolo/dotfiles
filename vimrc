" Setup for new machine:
" git clone git@github.com:gmarik/vundle.git
" and put in ~/.vim/bundle
" then start vim and go: :BundleInstall

set nocompatible
filetype off

" Vundle bundles:
" for setup on new machine do: git clone git@github.com:gmarik/vundle.git
" ~/.vim/bundle/vundle
" and then start vim and go: :BundleInstall
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'

" The Basics
filetype plugin indent on
syntax on
set nocompatible
set history=50
set laststatus=2
set incsearch
set nobackup
set nowritebackup
set noswapfile
set ruler
set relativenumber
set numberwidth=2
set backspace=indent,eol,start
set ttyfast
set showcmd
set wrap
set wildmenu
set textwidth=79
set modelines=0
set noerrorbells
set hlsearch

" Clear current search
nmap <silent> ,/ :nohlsearch<CR>

" Essential maps
inoremap jk <ESC>
nnoremap ; :
nnoremap ;; ;
nnoremap k gk
nnoremap j gj
let mapleader = ","

" Split maps
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Folding
nnoremap zz zfap
nnoremap <space> za
vnoremap <space> zf

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

" NERDTree
nnoremap <silent> <leader>q :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 20

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

set background=light
colorscheme molokai
let g:molokai_original = 1
