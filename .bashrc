#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PAGER="most"

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

sadconv() {
  rm -rf html 
  mkdir html 
  find . -name "*.sad" -type f -exec sh -c 'echo Converting $0 && sadhtml $0 && mkdir -p html/$(dirname $0) && mv $0.html html/$0.html' {} \;
}

alias hasistate='mosquitto_pub -h atuin -t hasi/state -m '
alias saddocs='~/workspace/saddocs/out/saddocs'
alias mmpv='mpv --no-video'
alias runter='shutdown now'
alias edit='vim'
alias py='python'
alias ac='audioconv'
alias sysup='sudo pacman -Syu | yay -Syu'
alias ls='eza --color=auto -l'
alias switchlayout='python ~/switchlayout.py'
alias stripwhite="sed -i 's/[ \t]*$//' "

PS1="\u@\h \t\n\W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')$ \[$(tput sgr0)\]"
pasfetch
pasmotd cyan bold underline

export PATH=$PATH:~/.cargo/bin
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
