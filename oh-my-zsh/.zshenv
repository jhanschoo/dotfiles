#!/usr/bin/env zsh

# add code to source all script files in .zshenv.d
if [[ -d "${HOME}/.zshenv.d" ]]
then
  for file in "${HOME}/.zshenv.d/"*
  do
    source "${file}"
  done
fi
