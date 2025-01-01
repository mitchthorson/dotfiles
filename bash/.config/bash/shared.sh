## shared shell configurations between linux and macos versions

# history
export SAVEHIST=50000
export HISTFILE=$HOME/.histfile
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# vi keybindings
set -o vi

# editor info
export EDITOR=nvim
export VISUAL=nvim

# command editor
# autoload -z edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v "edit-command-line"

# color key
# 0 black
# 1 red
# 2 green
# 3 yellow
# 4 blue
# 5 magenta
# 6 cyan
# 7 white
# 8 light black
# 9 light red
# 10 light green
# 11 light yellow
# 12 light blue
# 13 light magenta
# 14 light cyan
# 15 light white

# directories
export DOTFILES="$HOME/dotfiles"
export REPOS="$HOME/repos"
export SECOND_BRAIN="$HOME/obsidian/vault"

# aliases
alias vim="nvim"
alias mutt="neomutt"
alias dots="cd $DOTFILES"
alias repos="cd $REPOS"
alias nvrc="$DOTFILES/nvim/.config/nvim"
alias zrc="$EDITOR $HOME/dotfiles/zsh/.zshrc_linux"
alias ll="ls -lah"
alias c="clear"
alias glo="git log --oneline"
alias glg="git log --graph --decorate --oneline"
alias gwip='git commit -a -m "work in progress - fixup"'
alias lazydocker="TERM=screen-256color lazydocker"
alias pvpn="protonvpn-cli"

# plugins
# source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# golang stuff
export PATH=$PATH:/usr/local/go/bin
GOPATH="$HOME/go"
GOBIN="$GOPATH/bin"
export PATH=$GOBIN:$PATH

# pyenv
eval "$(pyenv init --path)"

# rust
# . "$HOME/.cargo/env"
export PATH=$PATH:/$HOME/.cargo/bin

# 1Password SSH agent
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH=$DENO_INSTALL/bin:$PATH

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Re-source the local file
if [ -f $HOME/.bash/local.sh ]; then
	source $HOME/.bash/local.sh
fi

# nvm setup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# startup starship
eval "$(starship init bash)"

# fzf
eval "$(fzf --bash)"


# zig
export PATH="$HOME/zig:$PATH"
