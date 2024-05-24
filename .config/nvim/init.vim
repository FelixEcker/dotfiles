set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'tikhomirov/vim-glsl'
call plug#end()

colorscheme gruvbox
au BufNewFile,BufRead *.mcfg,*.mb set filetype=mcfg
au BufNewFile,BufRead *.pas,*.pp set colorcolumn=100
