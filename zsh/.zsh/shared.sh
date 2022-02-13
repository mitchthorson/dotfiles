## Shared shell configurations between linux and macos versions

# vi keybindings
bindkey -v

# Editor info
export EDITOR=vim
export VISUAL=vim

# Command Editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v "edit-command-line"

# Prompt
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %F{white}on %F{yellow} %b'
PROMPT='%F{magenta}%n %F{white}in %F{cyan} %~${vcs_info_msg_0_} %F{white}❯ '
# RPROMPT='%F{blue}%* %F{green}%(?.﫟.)'

# aliases
alias vim="nvim"
alias DOTS="cd $HOME/dotfiles"
alias nvrc="cd $HOME/dotfiles/nvim/.config/nvim"
alias ls="ls --color=auto"
alias ll="ls -lah"
alias zrc="$EDITOR $HOME/dotfiles/zsh/.zshrc_linux"

# Plugins
source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# nvm setup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# golang stuff
GOPATH="$HOME/go"
GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOBIN

