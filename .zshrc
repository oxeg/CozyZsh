# reload completions
autoload -Uz compinit && compinit


# expand PATH
export PATH=/usr/local/bin:$PATH
# export PATH=/opt/homebrew/bin:$PATH


# env variables
# export JAVA_HOME=


# aliases
alias ll='ls -las'
alias cdc='cd ~/git'
alias pg='ps -ax | grep'


# kubectl completions
# source <(kubectl completion zsh)

# k3d completions
# source <(k3d completion zsh)

# brew completions
# FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# git completions
zstyle ':completion:*:*:git:*' script ~/.zsh/zsh-git-completion/git-completion.bash
fpath=(~/.zsh/zsh-git-completion/ $fpath)

# reload completions
autoload -Uz compinit && compinit

# case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# history autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# syntax highlight
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# git branch info
autoload -Uz vcs_info
precmd() { vcs_info }
PL_BRANCH_CHAR=$'\ue0a0'
zstyle ':vcs_info:git:*' formats "%F{cyan}%B|%%b $PL_BRANCH_CHAR %b%f "
setopt PROMPT_SUBST


# set PROMPT
# default PROMPT='%n@%m %1~ %#'
# see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
PROMPT='%(?.%B%F{green}√.%B%F{red}✖)%b%f %B%F{250}%1~%f%b ${vcs_info_msg_0_}%B❯%b '
