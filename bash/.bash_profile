# expose custom scripts before starting X
export PATH="$HOME/.local/bin:$PATH"

# source local variables before starting X
if [ -f $HOME/.bash/local.sh ]; then
	source $HOME/.bash/local.sh
fi

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

# starting up X
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

