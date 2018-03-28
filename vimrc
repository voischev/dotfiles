" settings
syntax enable
set encoding=utf-8
set fileformat=unix
set visualbell
set t_vb=
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

" spell
" http://www.opennet.ru/base/X/vim_orfo.txt.html
set spell spelllang=en,ru

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
" autocmd BufEnter * lcd %:p:h

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

autocmd BufRead,BufNewFile *.{bemtree,bemhtml} set ft=javascript

" Resize splits when the window is resized
" Only available for GUI
au VimResized * exe "normal! \<c-w>="

" Netrw
let g:netrw_banner=0
let g:netrw_localrmdir='rm -r'
