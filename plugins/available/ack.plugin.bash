# Use ack for grepping and find if ack is available
if type -P ack &>/dev/null ; then 
  g(){
    ack "$*" --color-match=green --color-filename=blue --smart-case
  }
  grb(){
    ack "$*" --type=ruby --color-match=green --color-filename=blue --smart-case
  }
  gwd(){
    ack "$*" --color-match=green --color-filename=blue --word-regexp --smart-case
  }
  gnolog(){
    ack "$*" --ignore-dir=log --color-match=green --color-filename=blue --smart-case
  }
  f(){
    ack -i -g ".*$*[^\/]*$" | highlight blue ".*/" green "$*[^/]"
  }
else
  g(){
    grep -Rin $1 *
  }
  f(){
    find . -iname "$1"
  }
fi
