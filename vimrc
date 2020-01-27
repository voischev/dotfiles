" settings
syntax enable
set encoding=utf-8
set scrolloff=30
set colorcolumn=80
set backspace=indent,eol,start
set hidden
set visualbell
set t_vb=
set noswapfile

" terminal
set notitle
set icon

" editing
set autoindent
set smartindent
set smarttab
set smartcase
set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4
set wrap
set linebreak
set cursorline
set list
set listchars=tab:→\ ,trail:·,eol:¬,extends:❯,precedes:❮,nbsp:×
set synmaxcol=210

" statusline
set laststatus=2
set statusline=:b%n\ %t\ %m\ %Y

" search
set incsearch
set hlsearch

" folding
set foldmethod=indent

" spell
" http://www.opennet.ru/base/X/vim_orfo.txt.html
set spell spelllang=en,ru

" buffers
nnoremap <Leader>[ :bprev<cr>
nnoremap <Leader>] :bnext<cr>

" [p]aste mode
set pastetoggle=<Leader>p

" [b]lame
" In Visual mode exec git blame with selected text
vnoremap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Load previous session
" Only available when compiled with the +viminfo feature
" set viminfo='10,\"100,:20,%,n~/.viminfo

" Set cursor to its last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Auto change the directory to the current file I'm working on
" autocmd BufEnter * lcd %:p:h

" Automatically removing all trailing whitespace
" autocmd BufWritePre *.{js,css,md} :%s/\s\+$//e

" everything is javascript for me
au BufNewFile,BufRead *.ts set filetype=javascript
au BufNewFile,BufRead *.tsx set filetype=javascript

" Netrw
let g:netrw_banner=0
let g:netrw_localrmdir='rm -r'

" Ack grep
set grepprg=ack\ -k
