# expand PATH
export PATH=/usr/local/bin:$PATH


# env variables
# 


# aliases
alias ll='ls -las'
alias cdc='cd ~/git'
alias pg='ps -ax | grep'

# alias k=kubectl


# git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/zsh-git-completion/git-completion.bash
fpath=(~/.zsh/zsh-git-completion/ $fpath)
autoload -Uz compinit && compinit


# case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# kubectl autocomplete
# make sure you have kubectl installed https://kubernetes.io/docs/tasks/tools/install-kubectl/
# source <(kubectl completion zsh)
# complete -F __start_kubectl k


# history autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# syntax highlight
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# git branch info
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '[%F{red}%b%f] '
setopt PROMPT_SUBST


# history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end


# set PROMPT
# default PROMPT='%n@%m %1~ %#'
# see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{250}%1~%f%b %B${vcs_info_msg_0_}%b> '
