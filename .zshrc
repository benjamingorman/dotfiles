### --- zsh
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="pmcgee"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git docker)

# Docker completions
source ~/completions/_docker

# Binds
bindkey '^R' history-incremental-search-backward

# Remove zsh right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
unset RPROMPT


### --- PATH
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin/"
export PATH="$PATH:/Users/beng/bin/"
export PATH="$PATH:/Users/beng/.yarn/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"


### --- Settings
export EDITOR='nvim'
export PROMPT="%{$fg[yellow]%}%1d %{$fg[blue]%}☯%{$reset_color%} "

set -o vi
# autoload -U colors && colors


### --- ALIASES
alias :e="nvim"
alias :q="exit"
alias dc="docker compose"
alias dockershell="docker run --rm -it --entrypoint=/bin/sh"
alias eaws="vim ~/.aws/credentials"
alias ezsh="vim ~/.zshrc"
alias findport="sudo lsof -i -P | grep LISTEN | grep"
alias g="git status"
alias ga="git add"
alias gau="git add -u"
alias gb="git branch"
alias gca="git commit --amend"
alias gcb="git checkout -b"
alias gch="git checkout"
alias gclone="git clone"
alias gcm="git commit -m"
alias gco="git commit"
alias gd="git diff"
alias gdc="git diff --cached"
alias gfilehistory="git log --follow -p --"
alias gitfixci="git add .gitlab-ci.yml && git commit -m 'Fix CI' && git push"
alias gl="git log --stat --abbrev-commit --graph --pretty=short"
alias gmergemaster="git checkout master && git pull && git checkout - && git merge master"
alias gpull="git pull"
alias gpush="git push"
alias grbc="git rebase --continue"
alias grepr="grep -rnIi"
alias lsports="sudo lsof -i -P | grep LISTEN"
alias nfproductionbackend="nine aws exec -a production --role backend --"
alias nfproductionro="nine aws exec -a production --role read-only --"
alias nfsp="nine aws exec -a staging --role power-access --"
alias nfstaging="nine aws exec -a staging --role read-only --"
alias nfstagingpower="nine aws exec -a staging --role power-access --"
alias nv="nvim"
alias proj="cd ~/Projects && ls"
alias szsh="source ~/.zshrc"
alias vi="nvim"
alias vim="nvim"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC -I rc"
alias xmllint="python -c 'import sys;import xml.dom.minidom;s=sys.stdin.read();print xml.dom.minidom.parseString(s).toprettyxml()'"


### --- NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


### --- golang
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"


### --- pyenv
## See pyenv README
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


### --- functions
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
