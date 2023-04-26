set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
call plug#begin()
Plug 'tikhomirov/vim-glsl'
Plug 'andweeb/presence.nvim'
call plug#end()
