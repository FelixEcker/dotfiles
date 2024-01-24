set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
call plug#end()

colorscheme vscode

" Load generic vimrc
source ~/.vimrc
