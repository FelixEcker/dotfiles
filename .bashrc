#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SNIP_PAGER="bat"
export PAGER="most"
export EDITOR="nvim"
export VISUAL="nvim"

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

diffbin() {
  diff -u --color <(xxd $1) <(xxd $2)
}

alias hasiscans='table=$(curl "http://getraenke-raspi.hasi:8080/scans" 2> /dev/null | jq -r ".response_data[] | [.id, .barcode, .date] | @tsv") && out=$(printf "ID\tBarcode\tDate\n" && echo -e "$table") && echo -e "$out"'
alias hasistate='mosquitto_pub -h atuin -t hasi/state -m '
alias saddocs='~/workspace/saddocs/out/saddocs'
alias mmpv='mpv --no-video'
alias runter='shutdown now'
alias edit='vim'
alias py='python'
alias ac='audioconv'
alias ls='eza --color=auto -l'
alias switchlayout='python ~/switchlayout.py'
alias stripwhite="sed -i 's/[ \t]*$//' "
alias memecontext="echo ich liebe schwarzen humor"

PS1="\u@\h \t\n\W \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')$ \[$(tput sgr0)\]"
pasfetch
pasmotd cyan bold underline

export PATH=$PATH:~/.cargo/bin
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

source ~/.local/share/blesh/ble.sh
