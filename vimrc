" in ~/.config/nvim/init.vim
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

set nocompatible
filetype off

" first:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then:
" :PlugInstall

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'adelarsq/vim-matchit'
Plug 'elixir-lang/vim-elixir'
Plug 'tomasr/molokai'
Plug 'rizzatti/dash.vim'
Plug 'guns/vim-clojure-static'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
" Plug 'rcoppolo/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'rcoppolo/aurelia'
Plug 'keith/swift.vim'
Plug 'vimwiki/vimwiki'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
Plug 'rakr/vim-one'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neovim/nvim-lspconfig'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

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
set textwidth=79
set formatoptions=qrn1

" enable per-directory .vimrc files
"" disable unsafe commands in local .vimrc files
set exrc
set secure

" add list lcs=tab:>-,trail:x for tab/trailing space visuals
autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent

"Save al buffers on loss of focus
:au FocusLost * silent! :wa

" Clear current search
nnoremap <silent> <leader><space> :noh<CR>

" Show registerj
nnoremap <silent> <leader>r :reg<CR>

let mapleader = ","

" Essential maps
inoremap jk <ESC>
nnoremap ; :
nnoremap ;; ;
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
noremap H ^
noremap L $
vnoremap L g_
nnoremap <tab> %
vnoremap <tab> %

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

" augroup vimrcEx
" " For all text files set 'textwidth' to 78 characters.
"   autocmd FileType text setlocal textwidth=78
" " When editing a file, always jump to the last known cursor position.
" " Don't do it when the position is invalid or when inside an event handler
" " (happens when dropping a file on gvim).
"   autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal g`\"" |
"     \ endif
" augroup END

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
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_clear_cache_on_exit=0

" NERDTree
nnoremap <silent> <leader>q :NERDTreeToggle<CR>
nnoremap <silent> <leader>a :NERDTreeFind<CR>
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
" nmap <silent> <leader>ec :e ~/.vim/colors/aurelia.vim<CR>

" This here auto reloads vim after vimrc save
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,aurelia.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

nmap <silent> ,p :call Paste()<CR>
nmap <silent> ,o :call NoPaste()<CR>

function! Paste()
  setlocal paste
endfunction

function! NoPaste()
  setlocal nopaste
endfunction

" Highlights lines that are too long an ugly red color
" highlight OverLength ctermbg=red ctermfg=white guibg=#333333
" match OverLength /\%81v.\+/

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
autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.yaws,*.xrl set expandtab
au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl setf erlang

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

" if exists('$TMUX')
"   function! TmuxOrSplitSwitch(wincmd, tmuxdir)
"     let previous_winnr = winnr()
"     silent! execute "wincmd " . a:wincmd
"     if previous_winnr == winnr()
"       call system("tmux select-pane -" . a:tmuxdir)
"       redraw!
"     endif
"   endfunction
"
"   let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
"   let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
"   let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
"
"   nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
"   nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
"   nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
"   nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
" else
"   map <C-h> <C-w>h
"   map <C-j> <C-w>j
"   map <C-k> <C-w>k
"   map <C-l> <C-w>l
" endif


" maintain cursor location when joining lines
vnoremap J mzJ`z

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" when searching/jumping move selection to center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g; g;zz
nnoremap g, g,zz

" typo prevention
" :command WQ wq
" :command Wq wq
" :command W w
" :command Q q
" :command Noh noh
" let g:ackprg = 'ag --vimgrep --smart-case'
" cnoreabbrev ag Ack
" cnoreabbrev aG Ack
" cnoreabbrev Ag Ack
" cnoreabbrev AG Ack

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

augroup Vimwiki
  autocmd!
  autocmd FileType vimwiki set textwidth=0
  autocmd FileType vimwiki set foldcolumn=2
  autocmd FileType vimwiki set nonumber
  autocmd FileType vimwiki set formatoptions=tqr1
  autocmd FileType vimwiki set wrap linebreak nolist
augroup END

augroup Markdown
  autocmd!
  autocmd FileType markdown set textwidth=0
  autocmd FileType markdown set foldcolumn=2
  " autocmd FileType markdown set nonumber
  autocmd FileType markdown set formatoptions=tqr1
  autocmd FileType markdown set wrap linebreak nolist
augroup END

nnoremap <C-p> :History<Cr>

nnoremap ,f :let @+ = expand("%")<Cr>

nnoremap * :keepjumps normal! mi*`i<CR>

" if (has("termguicolors"))
"  set termguicolors
" endif

set t_Co=256
set t_ut=
" colorscheme codedark
" colorscheme one
" call one#highlight('vimLineComment', 'ffffff', 'ffffff', 'none')
" colorscheme onehalfdark
" colorscheme night-owl
" colorscheme aurelia
colorscheme moonfly
" let g:molokai_original = 1
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight EndOfBuffer ctermbg=NONE
highlight LineNr ctermbg=NONE

let $BAT_THEME = 'Visual Studio Dark+'
" https://github.com/andresmichel/one-dark-theme/blob/master/One%20Dark.tmTheme
" let $BAT_THEME = 'onedark'

let g:airline_theme='codedark'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#ale#enabled = 1

" ale
nmap <silent> <S-C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

let g:ale_linters = {
\   'python': ['pyright'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1

set tags=tags
