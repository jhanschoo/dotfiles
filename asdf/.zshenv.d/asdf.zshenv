#!/usr/bin/env zsh

export ASDF_DIR="${HOME}/.asdf"
export PATH="${ASDF_DIR}/bin:${ASDF_DIR}/shims:${PATH}"
autoload -U compinit
autoload -U bashcompinit
compinit
bashcompinit
source "${ASDF_DIR}/completions/asdf.bash"
