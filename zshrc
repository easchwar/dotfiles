# Antigen plugins 
source ~/.antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions

# bind UP and DOWN keys for substring-search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# makes color constants available
autoload -U colors
colors

# zsh completion stuff: needed these to make git completion work
autoload -U compinit && compinit
zmodload -i zsh/complist

# enable colored output from ls, etc
export CLICOLOR=1

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[white]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# required by rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# for npm
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Fix CTRL keybindings
bindkey -e

# History search
bindkey '^R' history-incremental-search-backward

alias "be"="bundle exec"
alias "gadd"="git add"
alias "g"="git"
alias "gaa"="git add -A"
alias "gcm"="git commit -m"
alias "gco"="git checkout"
alias "gs"="git status"
alias "v=vim"
alias "aa"="cd ~/appacademy"
alias "r"="bundle exec rspec"

alias "slack"="~/slackbot.sh"
alias "schwarz"="./bin/slack xoxb-7338888535-H7yLopHOs1hD6b2KlZwCEprh"

alias "zip_all_files"='for f in *; do zip -r $f.zip $f; done'

eval "$(rbenv init -)"
eval "$(hub alias -s)"
