# CozyZsh
Cozy zsh setup with minimum set of features for comfortable work.

### Features

1. `git` completions
1. case insensitive completions
1. completions based on command history
1. syntax highlight
1. git branch info displayed in prompt
1. prompt indicates wheter previous command succeeded
1. [Optional] `kubectl`, `k3d`, `brew` completions

### Installation

```
git clone git@github.com:oxeg/CozyZsh.git
cd CozyZsh
chmod +x install.sh
./install.sh
```
Don't forget to restart your terminal

### Solutions used

* https://github.com/git/git/tree/master/contrib/completion
* https://superuser.com/a/1092328
* https://github.com/zsh-users/zsh-autosuggestions
* https://github.com/zsh-users/zsh-syntax-highlighting
* https://stackoverflow.com/a/1128583/1553934
* https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-zsh/
* https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
* https://k3d.io/usage/commands/k3d_completion/

### new way with ghostty and starship

```shell
brew install --cask ghostty
brew install starship
brew install zsh-autosuggestions zsh-syntax-highlighting
```

`~/.zshrc`
```shell
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

autoload -Uz compinit && compinit

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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


# expand PATH
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/Users/<user>/bin"


# env variables
# export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)


# ============================================
# Starship Prompt
# ============================================

eval "$(starship init zsh)"
```

`/Users/<user>/Library/Application Support/com.mitchellh.ghostty/config`
```
# This is the configuration file for Ghostty.
#
# This template file has been automatically created at the following
# path since Ghostty couldn't find any existing config files on your system:
#
#   /Users/<user>/Library/Application Support/com.mitchellh.ghostty/config
#
# The template does not set any default options, since Ghostty ships
# with sensible defaults for all options. Users should only need to set
# options that they want to change from the default.
#
# Run `ghostty +show-config --default --docs` to view a list of
# all available config options and their default values.
#
# Additionally, each config option is also explained in detail
# on Ghostty's website, at https://ghostty.org/docs/config.
#
# Ghostty can reload the configuration while running by using the menu
# options or the bound key (default: Command + Shift + comma on macOS and
# Control + Shift + comma on other platforms). Not all config options can be
# reloaded while running; some only apply to new windows and others may require
# a full restart to take effect.

# Config syntax crash course
# ==========================
# # The config file consists of simple key-value pairs,
# # separated by equals signs.
# font-family = Iosevka
# window-padding-x = 2
#
# # Spacing around the equals sign does not matter.
# # All of these are identical:
# key=value
# key= value
# key =value
# key = value
#
# # Any line beginning with a # is a comment. It's not possible to put
# # a comment after a config option, since it would be interpreted as a
# # part of the value. For example, this will have a value of "#123abc":
# background = #123abc
#
# # Empty values are used to reset config keys to default.
# key =
#
# # Some config options have unique syntaxes for their value,
# # which is explained in the docs for that config option.
# # Just for example:
# resize-overlay-duration = 4s 200ms

theme = JetBrains Darcula

unfocused-split-fill = #666666
split-divider-color = #888888

scrollback-limit = 10000000
maximize = true
shell-integration = zsh
```

`/Users/<user>/.config/starship.toml`
```toml
# Your custom prompt format
format = """
$directory$git_branch$git_status
$character"""

[directory]
style = "cyan"
truncation_length = 3
truncate_to_repo = true

[git_branch]
format = " [$symbol$branch]($style)"
style = "yellow"
symbol = ""

[git_status]
format = '([$all_status$ahead_behind]($style))'
style = "yellow"

[character]
success_symbol = "[✓](bold green) #"
error_symbol = "[✗](bold red) #"
```
