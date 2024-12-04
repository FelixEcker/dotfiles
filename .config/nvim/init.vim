set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'johngrib/vim-game-snake'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'NMAC427/guess-indent.nvim'
call plug#end()

" colorscheme gruvbox
highlight Normal  guibg=none
highlight NonText guibg=none
highlight Normal  ctermbg=none
highlight NonText ctermbg=none

source ~/.config/nvim/tsconf.lua

au BufRead,BufNewFile *.mcfg,*.mb set filetype=mcfg
au BufRead,BufNewFile *.pas,*.pp set colorcolumn=100

" Load generic vimrc
source ~/.vimrc

lua require('guess-indent').setup {}
