" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'andreasvc/vim-256noir'
Plugin 'nelstrom/vim-mac-classic-theme'
Plugin 'w0ng/vim-hybrid'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-repeat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'Dimercel/todo-vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'terryma/vim-multiple-cursors'

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
set encoding=utf-8
set fileformat=unix
set t_Co=256
set title
set number
set colorcolumn=80
set showcmd
set hidden
set history=1000
set backspace=indent,eol,start
set iskeyword+=-
set wildmenu
set wildignore+=.git,.svn
set wildignore+=*/bower_components/*,*/node_modules/*
set eol

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

" theme scheme
set cursorline
set list
set listchars=tab:→\ ,trail:·,eol:¬,extends:❯,precedes:❮,nbsp:×
set laststatus=2
set statusline=#%n:\%t\ %m\ %{&fileencoding}\ %Y\ %3.3(%c%)\ %3.9(%l/%L%)\ %<
set background=dark
colorscheme hybrid

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

" Warning: nightmare mode!
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Navigate with <Ctrl>-hjkl in Insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" create/open file in current folder
map <Leader>n :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" paste mode
set pastetoggle=<Leader>p

" replase
nnoremap <leader>r :<C-u>%s//<left>
vnoremap <leader>r :s//<left>

" buffers
nnoremap <Leader>b :<C-u>ls<cr>:b
nnoremap <Leader>bp :<C-u>bp<cr>
nnoremap <Leader>bn :<C-u>bn<cr>
nnoremap <Leader>w :<C-u>bw<cr>

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Automatically removing all trailing whitespace
autocmd BufWritePre *.{js,c} :%s/\s\+$//e

autocmd BufRead,BufNewFile *.{bemtree,bemhtml} set ft=javascript

" Plugins settings

" NerdTREE
    map <C-n> :NERDTreeToggle<CR>
    "autocmd vimenter * NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    let NERDTreeShowHidden=1
    let NERDTreeMinimalUI=1
    let NERDTreeQuitOnOpen=1
    let NERDTreeKeepTreeInNewTab=1
    let NERDTreeWinSize=40
    let NERDTreeIgnore=['.DS_Store']

" CtrlP
    let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|node_modules|bower_components|build)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" Easymotion
    nmap <C-j> <Plug>(easymotion-s)
    omap <C-j> <Plug>(easymotion-bd-t)
    vmap <C-j> <Plug>(easymotion-bd-t)

" Nerdcommenter
    let NERDSpaceDelims=1
    let NERDRemoveExtraSpaces=1

" Todo
    let g:todo_winheight = 10
    nmap <leader>t :TODOToggle<CR>

" Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_javascript_checkers = ["jshint", "jscs"]

    " open quicfix window with all error found
    " nmap <silent> <leader>ll :Errors<cr>
    " " previous syntastic error
    " nmap <silent> [ :lprev<cr>
    " " next syntastic error
    " nmap <silent> ] :lnext<cr>"

" ultisnips

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

