" MCFG/2 vim syntax file
" Author: Marie Eckert
" License: BSD 3-Clause License
" Github: https://github.com/FelixEcker/mcfg_2

let b:current_syntax = "mcfg"

" Define keywords and colors
syntax keyword mcfgKeyword sector section end
highlight link mcfgKeyword Keyword

" Define variables and colors
syntax keyword mcfgVariable list str bool u8 i8 u16 i16 u32 i32
highlight link mcfgVariable Type

" Define comments and colors
syntax match mcfgComment ";.*$"
highlight link mcfgComment Comment

" Define strings and colors
syntax region mcfgString start=+'+ end=+'+ keepend contains=mcfgStringEscape
highlight link mcfgString String
syntax match mcfgEscapeSeq '\\' contained
syntax match mcfgEscapeSeq '\'\'' contained
highlight link mcfgEscapeSeq SpecialChar

" Define booleans and colors
syntax match mcfgBoolean "\<\(true\|false\),\=\>"
highlight link mcfgBoolean Boolean

" Define numbers and colors
syntax match mcfgNumber "\<[0-9]\+\(,\)\=\>"
highlight link mcfgNumber Number

" Highlighting for file extensions
au BufNewFile,BufRead *.mcfg,*.mb set filetype=mcfg

