#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set directory of current project
export CURRENTPROJ=~/Projects/EdbertsDatabase

function proj() {
    SESSION=$USER
    cd $CURRENTPROJ
    tmux -2 new-session -d -s $SESSION
    tmux new-window -t $SESSION:1 -n "Project"
    tmux split-window -h
    tmux select-pane -t 0
    tmux send-keys "vim" C-m
    tmux -2 attach-session -t $SESSION
}

# For gnome-screenshot
export PICTURES="$HOME/Pictures"

# Set prompt text
export PS1="[\W]\\$ "

# Include ~/bin in path
export PATH=$PATH:$HOME/bin

alias pickcolor="gcolor2"

# Colors
PALETTE="#121212121212:#D7D787878787:#AFAFD7D78787:#F7F7F7F7AFAF:#8787AFAFD7D7:#D7D7AFAFD7D7:#AFAFD7D7D7D7:#E6E6E6E6E6E6:#121212121212:#D7D787878787:#AFAFD7D78787:#F7F7F7F7AFAF:#8787AFAFD7D7:#D7D7AFAFD7D7:#AFAFD7D7D7D7:#E6E6E6E6E6E6"
BG_COLOR="#1C1C1C1C1C1C"
FG_COLOR="#E6E6E6E6E6E6"

gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "$PALETTE"
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "$BG_COLOR"
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "$FG_COLOR"
gconftool-2 --set "/apps/guake/style/font/palette" --type string "$PALETTE"

export EDITOR=vim
export BROWSER=google-chrome-stable

#ALIASES
alias ls='ls --color=auto'
alias :q='exit'
function mkdcd () {
	mkdir "$1" && cd "$1"
}
alias spacman="sudo pacman -S"
alias stopx="pkill -15 X"
alias lsa="ls -a"
alias irc="hexchat"

#Git commands
alias gadd="git add"
alias gommit="git commit -m"
alias gatus="git status"
alias gpush="git push origin master"

setxkbmap gb -option caps:escape

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
