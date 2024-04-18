# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/Cellar/john-jumbo/1.9.0_1/share/john/:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="pmcgee"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


set -o vi
autoload -U colors && colors
export PS1="\w $ "

# Bash git prompt NOT WORKING
#if [ -f "$HOME/Projects/zsh-git-prompt/zshrc.sh" ]; then
#    source $HOME/Projects/zsh-git-prompt/zshrc.sh
#fi

# Docker completions
source ~/completions/_docker

export PROMPT="%{$fg[yellow]%}%1d %{$fg[blue]%}☯%{$reset_color%} "


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


## ALIASES
alias eaws="vim ~/.aws/credentials"
alias ezsh="vim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias grepr="grep -rnIi"
alias dc="docker compose"
alias g="git status"
alias gl="git log --stat --abbrev-commit --graph --pretty=short"
alias ga="git add"
alias gau="git add -u"
alias gca="git commit --amend"
alias gco="git commit"
alias gch="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gcm="git commit -m"
alias gpush="git push"
alias gclone="git clone"
alias gd="git diff"
alias gdc="git diff --cached"
alias grbc="git rebase --continue"
alias gfilehistory="git log --follow -p --"
alias gitfixci="git add .gitlab-ci.yml && git commit -m 'Fix CI' && git push"
alias gmergemaster="git checkout master && git pull && git checkout - && git merge master"
alias gpull="git pull"
alias :q="exit"
alias proj="cd ~/Projects && ls"
alias xmllint="python -c 'import sys;import xml.dom.minidom;s=sys.stdin.read();print xml.dom.minidom.parseString(s).toprettyxml()'"
alias dockershell="docker run --rm -it --entrypoint=/bin/sh"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'


## KEYS
bindkey '^R' history-incremental-search-backward


## PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin/"
export PATH="$PATH:/Users/beng/bin/"

## yarn
export PATH="$PATH:/Users/beng/.yarn/bin"


## golang
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"


## FUNCTIONS
function epoch_to_date() {
    date -j -f %s $1
}

function convert_to_raw() {
  ffmpeg -y -i "$1" -acodec pcm_s16le -f s16le -ac 1 -ar 16000 "$2"
}

function code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

function gopenrepo() {
  # Get the http URI of the repo in GitLab
  gitlab_url=$(git remote get-url origin | sed -E 's/(:|@)/\//g' | sed -E 's/\.git$//' | sed -E 's/^git\//https:\/\//')
  # Open the repo in a browser
  echo "Opening repo in browser: ${gitlab_url}"
  open ${gitlab_url}
}

function gpushfirst() {
  # Get the git:// repo URI
  git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
  # Get the https URL of the repo in GitLab
  gitlab_url=$(git remote get-url origin | sed -E 's/(:|@)/\//g' | sed -E 's/\.git$//' | sed -E 's/^git\//https:\/\//')
  # Open the repo in a browser
  echo "Opening repo in browser: ${gitlab_url}"
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  open "${gitlab_url}/-/merge_requests/new?merge_request%5Bsource_branch%5D=${branch_name}"
}

function add_newlines_to_all() {
    # Ensure every file ends with a newline
    git ls-files -z | while IFS= read -rd '' f; do if file --mime-encoding "$f" | grep -qv binary; then tail -c1 < "$f" | read -r _ || echo >> "$f"; fi; done
}

alias lsports="sudo lsof -i -P | grep LISTEN"
alias findport="sudo lsof -i -P | grep LISTEN | grep"


## PYENV
## See pyenv README
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
alias vi='nvim'
alias vim='nvim'
alias nv='nvim'
alias :e='nvim'

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
unset RPROMPT
