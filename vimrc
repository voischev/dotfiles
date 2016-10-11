" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" Plugins
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'matze/vim-move'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'editorconfig/editorconfig-vim'

" Color shemes
Plugin 'w0ng/vim-hybrid'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" settings
syntax enable
set nocp
set encoding=utf-8
set fileformat=unix
set t_Co=256
set title
" Don't show the intro message starting Vim
set shortmess+=I
set number
set colorcolumn=80
set showcmd
set hidden
set history=1000
set backspace=indent,eol,start
set eol
set scrolloff=30
set iskeyword+=-
set wildignore+=.DS_Store,.git,.svn
set wildignore+=*/bower_components/*,*/node_modules/*
set wildmenu
set wildmode=list:longest,full
set completeopt=menu
set path=.,,**

" indents
set autoindent
set smartindent
set smarttab
set smartcase
set ignorecase
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4

" color scheme
set cursorline
set list
set listchars=tab:→\ ,trail:·,eol:¬,extends:❯,precedes:❮,nbsp:×
set laststatus=2
set background=dark
colorscheme hybrid

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes . "B"
    else
        return (bytes / 1024) . "K"
    endif
endfunction

set statusline=#%n:\%t\ %m
set statusline+=\ \ %Y
set statusline+=\ \ %3.3(%c%)\ %3.9(%l/%L%)
set statusline+=\ \ %{FileSize()}
set statusline+=\ \ %{&fileencoding}

set wrap
set linebreak
set visualbell

" search
set incsearch
set hlsearch

" backups
set nobackup
set noswapfile

let mapleader = ","

" [n]ew/ope[n] file in current folder
map <Leader>n :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" [O]pen file under cursor in a new vertical split
nnoremap <Leader>o :<C-u>vertical wincmd f<CR>

" [p]aste mode
set pastetoggle=<Leader>p

" [r]eplase
nnoremap <Leader>r :<C-u>%s//<Left>
vnoremap <Leader>r :s//<Left>

" Search matches are always in center
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" [b]uffers
map <Leader>, <C-^>
nnoremap <Leader>b :buffers<cr>
nnoremap <Leader>bp :bprev<cr>
nnoremap <Leader>bn :bnext<cr>
nnoremap <Leader>w :<C-u>bw<cr>

" Load previous session
" Only available when compiled with the +viminfo feature
set viminfo='10,\"100,:20,%,n~/.viminfo
" Set cursor to its last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd BufRead,BufNewFile *.{bemtree,bemhtml} set ft=javascript

" Resize splits when the window is resized
" Only available for GUI
au VimResized * exe "normal! \<c-w>="

" Easymotion
    nmap <Leader>m <Plug>(easymotion-s)
    omap <Leader>m <Plug>(easymotion-bd-t)
    vmap <Leader>m <Plug>(easymotion-bd-t)

" Nerdcommenter
    let NERDSpaceDelims=1
    let NERDRemoveExtraSpaces=1

" vim-move
    let g:move_key_modifier = 'C'

