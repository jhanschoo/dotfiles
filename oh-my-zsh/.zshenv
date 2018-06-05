#!/usr/bin/env zsh

case "$(uname -s)" in
  Linux*)
    machine=Linux
    ;;
  Darwin*)
    machine=Darwin
    ;;
  CYGWIN*)
    machine=Cygwin
    ;;
  MINGW*)
    machine=MinGw
    ;;
  *)
    machine="UNKNOWN:$(uname -s)"
    ;;
esac

# Should only happen on Darwin and possibly BSD systems.
if [[ -x /usr/libexec/path_helper ]]; then
  eval $(/usr/libexec/path_helper -s)
fi

export PATH="${HOME}/bin:${HOME}/.local/bin:/usr/local/sbin:${PATH}"

# add code to source all script files in .zshenv.d
if [[ -d "${HOME}/.zshenv.d" ]]
then
  for file in "${HOME}/.zshenv.d/"*
  do
    source "${file}"
  done
fi

# define X envvars that are somehow not defined
export XDG_CONFIG_HOME="${HOME}/.config"

# workaround for /etc/profile resetting paths
export ZSHENV_SET_PATH="$PATH"
