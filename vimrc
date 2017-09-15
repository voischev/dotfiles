" Init Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
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
Plugin 'matze/vim-move'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'

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
set notitle
set icon
" Don't show the intro message starting Vim
set shortmess+=I
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

set statusline=:b%n\ %t\ %m
set statusline+=\ \ %Y
set statusline+=\ \ %3.3(%c%)\ %3.9(%l%)
set statusline+=\ \ %{FileSize()}
set statusline+=\ \ %{&fileencoding}

set wrap
set linebreak
" Show ↪ at the beginning of wrapped lines
"if has("linebreak")
"    let &sbr = nr2char(8618).' '
"endif
set visualbell

" search
set incsearch
set hlsearch

" backups
set nobackup
set noswapfile

" [n]ew/ope[n] file in current folder
map <Leader>n :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" [p]aste mode
set pastetoggle=<Leader>p

" buffers
nnoremap <Leader>[ :bprev<cr>
nnoremap <Leader>] :bnext<cr>

" [r]eplase
nnoremap <Leader>r :<C-u>%s//<Left>
vnoremap <Leader>r :s//<Left>

" [b]lame
" In Visual mode exec git blame with selected text
vnoremap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Search matches are always in center
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Load previous session
" Only available when compiled with the +viminfo feature
set viminfo='10,\"100,:20,%,n~/.viminfo

" Set cursor to its last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd BufRead,BufNewFile *.{bemtree,bemhtml} set ft=javascript

" Resize splits when the window is resized
" Only available for GUI
au VimResized * exe "normal! \<c-w>="

" Easymotion

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Disable SQL Omni

let g:omni_sql_no_default_maps = 1
let g:ftplugin_sql_omni_key = '<Leader>sql'
let g:ftplugin_sql_omni_key = '<Plug>DisableSqlOmni'

" Netrw

let g:netrw_banner=0

" Nerdcommenter

let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1

" vim-move

let g:move_key_modifier = 'C'
