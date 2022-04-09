" settings {{{
syntax enable
set synmaxcol=210
set encoding=utf-8
set backspace=indent,eol,start
set hidden
set visualbell
set t_vb=
set noswapfile
set wildmenu
set path+=**
" set wildignore+=**/node_modules/**
set isfname+=@-@
set suffixesadd=.js,.ts,.tsx
set lazyredraw
" }}}

" undo history {{{
if !isdirectory($HOME.'/.vim/undo')
    call mkdir($HOME.'/.vim/undo', 'p')
endif
set undofile
set undodir=$HOME/.vim/undo
" }}}

" terminal {{{
set notitle
set icon
" }}}

" editing {{{
set autoindent
set smartindent
set smarttab
set smartcase
set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4
set scrolloff=30
set colorcolumn=80
set relativenumber
set nowrap
set linebreak
set cursorline
set showmatch
set list
set listchars=tab:→\ ,trail:·,eol:¬,extends:❯,precedes:❮,nbsp:×
" }}}

" file types {{{
autocmd FileType markdown setlocal norelativenumber wrap
autocmd FileType javascript setlocal suffixesadd=.js
autocmd FileType typescript setlocal suffixesadd=.ts,.tsx,.d.ts
autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
" }}}

" search {{{
set incsearch
set hlsearch
" }}}

" folding {{{
set foldmethod=syntax
autocmd FileType vim,text setlocal foldmethod=marker
" }}}

" spell {{{
" http://www.opennet.ru/base/X/vim_orfo.txt.html
set spell spelllang=en,ru
" }}}

" buffers {{{
nnoremap <Leader>[ :bprev<cr>
nnoremap <Leader>] :bnext<cr>
" }}}

" [p]aste mode {{{
set pastetoggle=<Leader>p
" }}}

" [b]lame {{{
" In Visual mode exec git blame with selected text
vnoremap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
" }}}

" ya [p]aste {{{
" In Visual mode exec ya paste with selected text
vnoremap <Leader>p :<C-U>!ya paste <(cat <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p )<CR>
" }}}

" Load previous session {{{
" Only available when compiled with the +viminfo feature
" set viminfo='10,\"100,:20,%,n~/.viminfo
" }}}

" Set cursor to its last position {{{
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" }}}

" Auto change the directory to the current file I'm working on {{{
" autocmd BufEnter * lcd %:p:h
" }}}

" Убирает тормоза при работе с большими файлами {{{
autocmd BufEnter * call clearmatches()
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | setlocal nospell | endif
" }}}

" Automatically removing all trailing whitespace {{{
" autocmd BufWritePre *.{js,css,md} :%s/\s\+$//e
" }}}

" Netrw {{{
let g:netrw_banner=0
let g:netrw_localrmdir='rm -r'
let g:netrw_keepdir=0
" }}}

" Ack grep {{{
" :grep PATERN PATH | :copen
set grepprg=ack
" }}}

" Experemntal {{{

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
" set timeoutlen=200
set notimeout
set ttimeout
set ttimeoutlen=100

" }}}
