#!/usr/bin/env bash

prompt() {
  return_value=$?;
  if [ $IS_REMOTE = 'true' ] ; then
  	prompt="${purple}\w${reset_color}${cyan}$(__git_ps1)${reset_color}"
  else
  	prompt="${green}\w${reset_color}${cyan}$(__git_ps1)${reset_color}"
  fi
  if test $return_value -eq 0
  then
    PS1="${prompt} > "
  else
    PS1="${prompt}${red} > ${reset_color}"
  fi
}

PROMPT_COMMAND=prompt

export LSCOLORS=