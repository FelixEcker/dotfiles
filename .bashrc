#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PAGER="most"

# Go forward in Git commit hierarchy, towards particular commit
# Usage:
#  gofwd v1.2.7
# Does nothing when the parameter is not specified.
gofwd() {
  git checkout $(git rev-list --topo-order HEAD.."$*" | tail -1)
}

# Go back in Git commit hierarchy
# Usage:
#  goback
alias goback='git checkout HEAD~'

alias mmpv='mpv --no-video'
alias runter='shutdown now'
alias edit='vim'
alias py='python'
alias ac='audioconv'
alias sysup='sudo pacman -Syu | yay -Syu'
alias ls='exa --color=auto -l --icons'
alias switchlayout='python ~/switchlayout.py'
alias fixkeyboard='sudo g810-led -a ffffff'

PS1="\u@\h \n\W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')$ \[$(tput sgr0)\]"
pasfetch
pasmotd cyan bold underline
