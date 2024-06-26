set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'ellisonleao/gruvbox.nvim'
call plug#end()

colorscheme gruvbox

au BufRead,BufNewFile *.mcfg,*.mb set filetype=mcfg
au BufRead,BufNewFile *.pas,*.pp set colorcolumn=100

" Load generic vimrc
source ~/.vimrc
