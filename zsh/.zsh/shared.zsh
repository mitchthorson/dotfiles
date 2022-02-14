## shared shell configurations between linux and macos versions

# history
export SAVEHIST=50000
export HISTFILE=$HOME/.histfile

# vi keybindings
bindkey -v

# editor info
export EDITOR=vim
export VISUAL=vim

# command editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v "edit-command-line"

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

# prompt
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %F{white}on %F{14} %b'
PROMPT='%F{9}%n %F{white}in %F{13} %~${vcs_info_msg_0_} %F{3}❯ '
# RPROMPT='%F{blue}%* %F{green}%(?.﫟.)'

# aliases
alias vim="nvim"
alias DOTS="cd $HOME/dotfiles"
alias nvrc="cd $HOME/dotfiles/nvim/.config/nvim"
alias ls="ls --color=auto"
alias ll="ls -lah"
alias zrc="$EDITOR $HOME/dotfiles/zsh/.zshrc_linux"

# plugins
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

