# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

plugins=(
	git
	zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  z
  fzf
  copypath
)

# Themes
#ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# Plugins
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

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

# Quick cd using fzf
fcd() {
  cd "$(find -type d | fzf --preview 'tree -C {} | head -200' --preview-window 'up:60%')"
}

# Find and edit using fzf
fe() {
  nvim "$(find -type f | fzf --preview 'cat {}' --preview-window 'up:60%')"
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
alias ff="fastfetch"
alias apt="sudo apt"

# Power
alias /sbin/shutdown -r now="reboot"
alias /sbin/shutdown -h now="poweroff"

# Networking
alias nmconnect="nmcli device wifi connect"
alias nmdown="nmcli c delete"
alias nmlist="nmcli device wifi list"
alias nmdelete="nmcli device delete"

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL"
export NVM_DIR="$HOME/.nvm"

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
