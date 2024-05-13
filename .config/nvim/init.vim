set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'tikhomirov/vim-glsl'
call plug#end()

colorscheme vscode
au BufNewFile,BufRead *.mcfg,*.mb set filetype=mcfg
