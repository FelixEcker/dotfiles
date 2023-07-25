# ~/.bashrc

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
alias ls="exa -lh --color=always"
alias la="exa -lha --color=auto"
alias lb="exa -lB --color=auto"
alias get_idf='. ~/projects/esp-idf/export.sh'
alias stripwhite="sed -i 's/[ \t]*$//' "

# /cool/ prompt
PS1="\u@\h \n\W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')$ \[$(tput sgr0)\]"
