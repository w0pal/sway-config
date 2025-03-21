# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
#export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"


# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Plugins
eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Cache eval statements to speed up initialization
zinit light mafredri/zsh-async

# Set Zsh options for performance
# Optimize compinit execution
# Skip global compinit if it's already run
skip_global_compinit=1

# Lazy load nvm to improve startup time
zstyle ':omz:plugins:nvm' lazy yes
zinit light ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/nvm

# Load plugins with Turbo Mode
zinit ice wait"0" lucid
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait"1" lucid
zinit light zsh-users/zsh-completions

zinit ice wait"2" lucid
zinit light zsh-users/zsh-autosuggestions

# Load snippets with Turbo Mode
zinit ice wait"1" lucid
zinit snippet OMZL::git.zsh

zinit ice wait"3" lucid
zinit snippet OMZP::nvm

zinit ice wait"2" lucid
zinit snippet OMZP::git

# Cache eval statements to speed up initialization
zinit light mafredri/zsh-async

# Load zsh-vi-mode plugin
zinit light jeffreytse/zsh-vi-mode
bindkey -v

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Load starship theme
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt inc_append_history    # Append history incrementally

# Use menu selection for completions
zstyle ':completion:*' menu select

# Group matches and describe them
zstyle ':completion:*' group-name ''

# List all matches
zstyle ':completion:*' list-colors ''

# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Make ls command feels like oh-my-zsh
bindkey -s '\el' 'ls\n'
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -lF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
elif command -v nvim >/dev/null 2>&1; then
  export EDITOR='nvim'
else
  export EDITOR='nano'
fi

# Shell Wrapper yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

ssh_fzf() {
    local host=$(grep "Host " ~/.ssh/config | cut -d " " -f 2 | fzf)
    if [[ -n $host ]]; then
        ssh "$host"
    else
        echo "No host selected"
    fi
}

# Alias
alias ls="exa --icons"
alias reload="source ~/.zshrc"
alias activate-py="source /opt/pyvenv/bin/activate"
alias config="eval $EDITOR ~/.zshrc"
alias xampp-start="sudo /opt/lampp/xampp start"
alias xampp-stop="sudo /opt/lampp/xampp stop"
alias bat=batcat
alias fix_waybar='sudo killall waybar; swaymsg reload'
alias sway-app='swaymsg -t get_tree | grep "app_id"'
alias cleanpkg="sudo apt-get autoremove --purge $(deborphan --nice-mode)"
alias sway-conf="eval $EDITOR ~/.config/sway/config"

# Power
alias /sbin/shutdown -r now="reboot"
alias /sbin/shutdown -h now="poweroff"

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL"
export NVM_DIR="$HOME/.nvm"
