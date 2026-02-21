# ============================================
# Auto-completions
# ============================================

# Enable Zsh completion system
autoload -Uz compinit && compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Better completion menu
zstyle ':completion:*' menu select

# history autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# project8s + docker + helm + kubectl completions
# ./projects completion zsh > ~/.zsh/completions/_projects
# docker completion zsh > ~/.zsh/completions/_docker
# helm completion zsh > ~/.zsh/completions/_helm
# kubectl completion zsh > ~/.zsh/completions/_kubectl
fpath=(~/.zsh/completions $fpath)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion:*:*:git:*' use-compctl false
zstyle ':completion:*:*:git:*' verbose false

autoload -Uz compinit && compinit

# ============================================
# Additional useful settings
# ============================================

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Better directory navigation
setopt AUTO_CD              # cd by typing directory name
setopt AUTO_PUSHD          # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS   # Don't push duplicates

# ============================================
# User aliases
# ============================================
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# ============================================
# User settings
# ============================================

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export TERM=xterm-256color

# expand PATH
export PATH="$PATH:/Users/egors/.local/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/Users/egors/bin"


# env variables
export JAVA_HOME=$(/usr/libexec/java_home -v 17)

# aliases
alias code='codium'

# ============================================
# Starship Prompt
# ============================================

eval "$(starship init zsh)"
