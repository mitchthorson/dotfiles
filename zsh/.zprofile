# expose custom scripts before starting X
export PATH="$HOME/.local/bin:$PATH"

# source local variables before starting X
if [ -f $HOME/.zsh/local.zsh ]; then
	source $HOME/.zsh/local.zsh
fi

# starting up X
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
