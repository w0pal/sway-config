# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes
#ZSH_THEME="robbyrussell"
plugins=(
	git
	zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Plugins
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Alias
alias ls="exa --icons"
alias zsh-reload="source ~/.zshrc"
alias activate-py="source /opt/pyvenv/bin/activate"
alias zsh-config="eval $EDITOR ~/.zshrc"
alias xampp-start="sudo /opt/lampp/xampp start"
alias xampp-stop="sudo /opt/lampp/xampp stop"
alias bat=batcat
alias fix_waybar='sudo killall waybar; swaymsg reload'
alias sway-app='swaymsg -t get_tree | grep "app_id"'

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL"
export NVM_DIR="$HOME/.nvm"

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
