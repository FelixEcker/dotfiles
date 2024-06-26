set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'andweeb/presence.nvim'
call plug#end()

colorscheme vscode

au BufRead,BufNewFile *.mcfg,*.mb set filetype=mcfg
