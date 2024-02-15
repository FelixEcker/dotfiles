set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
call plug#begin()
Plug 'Stoozy/vimcord'
Plug 'Mofiqul/vscode.nvim'
call plug#end()

colorscheme vscode
au BufNewFile,BufRead *.mcfg,*.mb set filetype=mcfg
