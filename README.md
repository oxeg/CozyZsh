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
