set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'ntk148v/komau.vim'
Plug 'andweeb/presence.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let g:komau_config = {
      \ 'style': 'dark',
      \ 'transparent': v:false,
      \ 'integrations': { 'treesitter': v:false }
      \ }
lua require('komau').setup(vim.g.komau_config)
colorscheme komau

"highlight Normal  guibg=none
"highlight Normal  ctermbg=none

" source ~/.config/nvim/tsconf.lua

au BufRead,BufNewFile *.mcfg,*.mb set filetype=mcfg

autocmd TermOpen * setlocal nonumber norelativenumber

source ~/.vimrc
