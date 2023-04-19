# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# .local custom scripts
export PATH=~/.local/scripts:$PATH
# .local bin
export PATH=~/.local/bin:$PATH
# Projects folder
export PROJECTS=~/Desktop/Projects
# flavours directories
export FLAVOURS_CONFIG_FILE=~/.config/flavours/config.toml
export FLAVOURS_DATA_DIRECTORY=~/.config/flavours/
# Spicetify
export SPICETIFY_INSTALL="~/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

# Load completion system
autoload -U compinit; compinit

# Update oh-my-zsh
zstyle ':omz:update' mode reminder
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ZSH theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Oh My Zsh Plugins
plugins=(
  bundler
  gh
  dotenv
  macOS
  rust
  sudo
  web-search
  copypath
  copyfile
  jsontools
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dane/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dane/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dane/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dane/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# pnpm
export PNPM_HOME="~/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
