set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
call plug#end()

colorscheme vscode

au BufRead,BufNewFile *.mcfg,*.mb set filetype=mcfg

" Load generic vimrc
source ~/.vimrc
