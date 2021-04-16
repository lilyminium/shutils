# Overwrite system programs
alias ls='ls -G'
alias rsync='rsync -P -r'
alias cp='cp -r'
alias du='du -hsc'


function scp_wrap {
  local -a args
  local i
  for i in "$@"; do case $i in
    (*:*) args+=($i) ;;
    (*) args+=(${~i}) ;;
  esac; done
  command scp "${(@)args}"
}

alias scp='noglob scp_wrap -r'  # necessary for proper scp pattern matching