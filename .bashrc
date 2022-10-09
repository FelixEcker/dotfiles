#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias mmpv='mpv --no-video'
alias runter='shutdown now'
alias edit='vim'
alias py='python'
alias ac='audioconv'
alias sysup='sudo pacman -Syu && yay -Syu'
alias ls='exa --color=auto -l'

PS1="\u@\h \n\W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')$ \[$(tput sgr0)\]"
pasfetch

# mpv refuses to work without setting display to :0
export DISPLAY=:0
. "$HOME/.cargo/env"
