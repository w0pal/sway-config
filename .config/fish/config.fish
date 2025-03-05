if status is-interactive
    # Commands to run in interactive sessions can go here
    # Hide Fish Greeting
    set -g fish_greeting

    # Add Starship
    starship init fish | source

    # Change default code editor
    set -gx EDITOR nvim

    # Aliases
    alias ls "exa --icons"
    alias fish-reload "source ~/.config/fish/config.fish"
    alias activate-py "source /opt/pyvenv/bin/activate.fish"
    alias fish-config "eval $EDITOR ~/.config/fish/config.fish"
    alias starship-config "eval $EDITOR ~/.config/starship.toml"
    alias xampp-start "sudo /opt/lampp/xampp start"
    alias xampp-stop "sudo /opt/lampp/xampp stop"
    alias bat batcat
    alias fix_waybar 'sudo killall waybar; swaymsg reload'
    alias sway-app 'swaymsg -t get_tree | grep "app_id"'
    # Set Path
    set -gx PIPX_HOME "/home/$USER/.local/bin"
    set -gx PATH "$PIPX_HOME" $PATH
    set -U fish_user_paths /usr/local/go/bin/ $fish_user_paths
    set -U fish_user_paths /home/$USER/bin/ $fish_user_paths
end

fish_add_path /home/naufal/.spicetify
fish_add_path /home/naufal/.cargo/bin

# ZVM
set -gx ZVM_INSTALL "$HOME/.zvm/self"
set -gx PATH $PATH "$HOME/.zvm/bin"
set -gx PATH $PATH "$ZVM_INSTALL/"
