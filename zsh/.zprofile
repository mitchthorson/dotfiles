# expose custom scripts before starting X
export PATH="$HOME/.local/bin:$PATH"

# source local variables before starting X
source $HOME/.oh-my-zsh/custom/local.zsh

# starting up X
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
