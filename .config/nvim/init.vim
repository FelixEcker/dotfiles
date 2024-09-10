set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'johngrib/vim-game-snake'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme gruvbox

source ~/.config/nvim/tsconf.lua

au BufRead,BufNewFile *.mcfg,*.mb set filetype=mcfg
au BufRead,BufNewFile *.pas,*.pp set colorcolumn=100

" Load generic vimrc
source ~/.vimrc
