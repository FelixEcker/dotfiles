#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PAGER="most"

alias mmpv='mpv --no-video'
alias runter='shutdown now'
alias edit='vim'
alias py='python'
alias ac='audioconv'
alias sysup='sudo pacman -Syu | yay -Syu'
alias ls='exa --color=auto -l'
alias switchlayout='python ~/switchlayout.py'

PS1="\u@\h \n\W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')$ \[$(tput sgr0)\]"
pasfetch
pasmotd cyan bold underline
