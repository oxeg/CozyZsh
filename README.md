# CozyZsh
Cozy zsh setup with minimum set of features for comfortable work.

Copy `.zshrc` for reference. Don't forget to backup your current `.zshrc` file.

### new way with ghostty and starship

```shell
brew install --cask ghostty
brew install starship
brew install zsh-autosuggestions zsh-syntax-highlighting
brew install --cask vscodium
```

`~/.config/ghostty/config`
```
unfocused-split-fill = #666666
split-divider-color = #888888

background-opacity = 0.9
background-blur = true
scrollback-limit = 10000000
maximize = true
shell-integration = zsh
working-directory = /Users/egors
window-inherit-working-directory = false
shell-integration-features = ssh-env

# ============================================
# Color theme
# ============================================

# Soft green on dark background
background = 181818
foreground = 88ee88

# Cursor
cursor-color = 90ee90

# Black and grays
palette = 0=#1a1a1a
palette = 8=#4a4a4a

# Reds
palette = 1=#cd5c5c
palette = 9=#f08080

# Greens
palette = 2=#7fbc7f
palette = 10=#9fcf9f

# Yellows
palette = 3=#daa520
palette = 11=#f0e68c

# Blues
palette = 4=#6495ed
palette = 12=#87ceeb

# Magentas
palette = 5=#ba55d3
palette = 13=#dda0dd

# Cyans
palette = 6=#5f9ea0
palette = 14=#7ec0c2

# Whites
palette = 7=#d3d3d3
palette = 15=#f5f5f5

```

`~/.config/starship.toml`
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
