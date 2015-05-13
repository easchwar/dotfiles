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
alias "gaa"="git add -A"
alias "gcm"="git commit -m"

eval "$(rbenv init -)"
eval "$(hub alias -s)"
