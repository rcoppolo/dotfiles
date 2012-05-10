"Setup for new machine:
"git clone git@github.com:gmarik/vundle.git
"and put in ~/.vim/bundle
"then start vim and go: :BundleInstall

set nocompatible
filetype off

"Vundle bundles:
"  for setup on new machine do: git clone git@github.com:gmarik/vundle.git
"  ~/.vim/bundle/vundle
"  and then start vim and go: :BundleInstall
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on
syntax on
set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set list listchars=tab:»·,trail:·
inoremap jj <ESC>
nnoremap ; :
nnoremap k gk
nnoremap j gj

let mapleader = ","

set number

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> q :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 20

set wrap
set textwidth=79
set formatoptions=qrn1

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" Improve syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown

set directory=~/.vim/tmp
set backupdir=~/.vim/backup
set backup

nnoremap / /\v
vnoremap / /\v

set mouse=a

au FocusLost * :wa

syntax on
colorscheme tomorrow-night

" first, enable status line always
set laststatus=2

" now set it up to change the status line based on mode
if version >= 700
    au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
    au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" This here auto reloads vim after vimrc save
augroup myvimrc
      au!
          au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
