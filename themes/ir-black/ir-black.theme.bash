#!/usr/bin/env bash

function virtualenv_prompt() {
  if [ ! -z "$VIRTUAL_ENV" ]
  then
    local env=$(dirname $VIRTUAL_ENV)
    echo " [${env##*/}]"
  fi
}

function conda_prompt() {
  if [ ! -z "$CONDA_DEFAULT_ENV" ]
  then
    local env=$(dirname $CONDA_DEFAULT_ENV)
    echo " [${CONDA_DEFAULT_ENV}]"
  fi
}

function prompt() {
  return_value=$?;
  if [ $IS_REMOTE = 'true' ] ; then
  	prompt="${purple}\w${reset_color}${cyan}$(__git_ps1)${reset_color}${bold_blue}$(virtualenv_prompt)${bold_purple}$(conda_prompt)${reset_color}"
  else
  	prompt="${green}\w${reset_color}${cyan}$(__git_ps1)${reset_color}${bold_blue}$(virtualenv_prompt)${bold_purple}$(conda_prompt)${reset_color}"
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
