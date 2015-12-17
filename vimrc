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

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
" Plugin 'plasticboy/vim-markdown'

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
set title
set number
set colorcolumn=80
set showcmd
set hidden
set history=1000
set backspace=indent,eol,start
" set backupdir=~/.tmp
" set directory=~/.tmp

" indents
set autoindent
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4

" theme scheme
set cursorline
set list
set listchars=tab:→\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set laststatus=2
set statusline=#%n:\%t\ %m\ %{&fileencoding}\ %Y\ %3.3(%c%)\ %3.9(%l/%L%)\ %<
set wrap
set linebreak
set t_Co=256
set visualbell
set background=dark
colorscheme solarized

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

" create/open file in current folder
map <Leader>n :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" paste mode
nnoremap <leader>v :set invpaste paste?<CR>

" buffers
nnoremap <Leader>b :<C-u>ls<cr>:b
nnoremap <Leader>bp :<C-u>bp<cr>
nnoremap <Leader>bn :<C-u>bn<cr>
nnoremap <Leader>w :<C-u>bw<cr>

" Plugins Settings

" NerdTREE
map <C-n> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
let NERDTreeKeepTreeInNewTab=1

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|bower_components|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set wildignore+=**/bower_components/*,**/node_modules/*

" Jump to (Easymotion)
nmap <C-j> <Plug>(easymotion-s)
omap <C-j> <Plug>(easymotion-bd-t)
vmap <C-j> <Plug>(easymotion-bd-t)

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
