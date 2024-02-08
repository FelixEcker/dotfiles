#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PAGER="less"
export MANPAGER="less"

cfmt() {
  touch $1.formatted
  clang-format $1 > $1.formatted
  mv $1.formatted $1
}

# Usage:
#   mcfmt <name pattern>
mcfmt() {
  find . -name "$1" -type f -exec bash -c 'echo formatting "$0" && clang-format "$0" > "$0".2 && mv "$0".2 "$0"' {} \;
}

alias ls='ls -lh --color=auto'
alias grep='grep --color=auto'
alias runter="poweroff"

PS1='[\u@\h \W]\$ '

pasfetch
source ~/.local/share/blesh/ble.sh
