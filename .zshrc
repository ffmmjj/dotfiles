#zmodload zsh/zprof

## From https://mijndertstuij.nl/posts/life-is-too-short-for-a-slow-terminal/, only run if current cache (zcompdump) is older than 24h
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qNmh-24) ]]; then
  compinit -C
else
  compinit
fi

eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init - zsh)"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Hint from https://mijndertstuij.nl/posts/life-is-too-short-for-a-slow-terminal/ to lazy-load nvm
#nvm() {
#  unset -f nvm
#  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
#  [ -s "$NVM_DIR/bash_completion.d/nvm" ] && \. "$NVM_DIR/bash_completion.d/nvm"
#  nvm "$@"
#}

# FNM zsh setup
#eval "$(fnm env --use-on-cd --shell zsh)"

export PATH="$HOME/.local/bin:$PATH"

# Bind Up Arrow to history search
bindkey '^[[A' up-line-or-search
# Bind Down Arrow to history search
bindkey '^[[B' down-line-or-search

# Load secrets from ~/.env (gitignored)
[ -f ~/.env ] && source ~/.env

export TESTCONTAINERS_RYUK_DISABLED=true

alias bupd='brew update'
alias bupg='brew upgrade'

alias gcm='git checkout main'
alias gprom='git pull -r origin main'

alias hermes='hermes --tui'


# Keybindings
bindkey "^[[3;3~"  kill-word             # ALT+delete

#zprof
eval "$(/Users/felipe/.local/bin/mise activate zsh)"
