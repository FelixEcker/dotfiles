set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
call plug#begin()
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'tikhomirov/vim-glsl'
call plug#end()
