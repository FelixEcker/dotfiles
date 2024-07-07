set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'andweeb/presence.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme gruvbox
highlight Normal  guibg=none
highlight Normal  ctermbg=none

source ~/.config/nvim/tsconf.lua

au BufRead,BufNewFile *.mcfg,*.mb set filetype=mcfg
au BufRead,BufNewFile *.pas,*.pp set colorcolumn=100

source ~/.vimrc
