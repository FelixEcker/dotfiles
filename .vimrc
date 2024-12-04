" -- look & feel -- "
set number

set linebreak
set showbreak=+++
set textwidth=80
set colorcolumn=81

set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent noexpandtab tabstop=4 shiftwidth=4
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.
set list

set ruler
set showtabline=2

set mouse=
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

" -- Autos -- "
autocmd TermOpen * setlocal nonumber norelativenumber
