" -- look & feel -- "
set number

set linebreak
set showbreak=+++
set textwidth=160
set colorcolumn=160

set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set ruler
set showtabline=2

set undolevels=1000
set backspace=indent,eol,start
syntax on

" -- Keymapping -- "
" Disable search highlight
nnoremap <esc> :noh<cr>
" Strip trailing whitespace
nmap rw :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Keybind for exiting Terminalmode
tnoremap <Esc><C-n> <C-\><C-n>
" Keybind for opening a new Bash Terminal
nnoremap <F1> :tabe term://bash<CR>
" Tab Previous
nnoremap <C-y> :tabp<cr>
" Tab Next
nnoremap <C-x> :tabn<cr>

" -- AutoCmds -- "
autocmd TermOpen * setlocal nonumber
