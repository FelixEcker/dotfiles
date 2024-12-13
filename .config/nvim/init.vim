set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'johngrib/vim-game-snake'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.
set list

source ~/.config/nvim/tsconf.lua

au BufRead,BufNewFile *.mcfg,*.mb set filetype=mcfg
au BufRead,BufNewFile *.pas,*.pp set colorcolumn=100

" Load generic vimrc
source ~/.vimrc
