# expose custom scripts before starting X
export PATH="$HOME/.local/bin:$PATH"

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

# source local variables before starting X
if [ -f $HOME/.config/bash/local.sh ]; then
	source $HOME/.config/bash/local.sh
fi

# starting up X
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi


. "$HOME/.cargo/env"
