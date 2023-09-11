# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PAGER="most"
export EDITOR="nvim"
export VISUAL="nvim"

# Go forward in Git commit hierarchy, towards particular commit 
# Usage:
#  gofwd v1.2.7
# Does nothing when the parameter is not specified.
gofwd() {
  git checkout $(git rev-list --topo-order HEAD.."$*" | tail -1)
}

# Usage:
#   cfmt <file>
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

export -f cfmt

# Go back in Git commit hierarchy
# Usage: 
#  goback
alias goback='git checkout HEAD~'
alias ls="eza -lh --color=always"
alias la="eza -lha --color=auto"
alias lb="eza -lB --color=auto"
alias get_idf='. ~/projects/esp-idf/export.sh'
alias stripwhite="sed -i 's/[ \t]*$//' "

# /cool/ prompt
PS1="\u@\h \n\W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')$ \[$(tput sgr0)\]"

pasfetch
pasmotd red bold
. "$HOME/.cargo/env"
