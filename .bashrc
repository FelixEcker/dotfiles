#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SNIP_PAGER="bat"
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

gitsafe() {
  git config --global --add safe.directory $(pwd -P)
}

# Go back in Git commit hierarchy
# Usage:
#  goback
alias goback='git checkout HEAD~'

alias mmpv='mpv --no-video'
alias runter='shutdown now'
alias ls='exa --color=auto -l --icons'
alias fixkeyboard='sudo g810-led -a ffffff'

source /usr/share/git/completion/git-prompt.sh

PS1='[\u@\h \W]\$ '

pasfetch
pasmotd cyan bold underline
source ~/.local/share/blesh/ble.sh
