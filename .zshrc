# Path to your oh-my-zsh configuration.
ZSH=/Users/chris/development/nix/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="potato-bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bower brew cp docker fabric git osx pip python)

# Source init scripts
source $ZSH/oh-my-zsh.sh

# Remove default virtualenv from prompt:
VIRTUAL_ENV_DISABLE_PROMPT=true

# Exports
export LSCOLORS=GxfxbxdxCxegedabagacad
export DOCKER_HOST=tcp://192.168.59.103:2375
export GOPATH=$HOME/development/go
export ANSIBLE_INVENTORY=/etc/ansible/hosts
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/chris/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

# Add things to path
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/google_appengine:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:/usr/local/texlive/2015/bin/universal-darwin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/go_appengine

# The next line updates PATH for the Google Cloud SDK.
source '/Users/chris/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/Users/chris/google-cloud-sdk/completion.zsh.inc'

# Turn off annoying zsh autocorrect
unsetopt correct_all

# Aliases:
alias fuck='sudo $(fc -ln -1)'
unalias gb

# Simple funcitons:
function gi() { curl -s https://www.gitignore.io/api/${(j:,:)@} ;}
dip() {
	boot2docker ip 2> /dev/null
}

denter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}

texcompile() {
	pdflatex $1
	bibtex $1
	pdflatex $1
	pdflatex $1
}

lock() {
    # Lockscreen function
    # remove old screen
    rm -rf ~/tmp/screenshots/screen.png

    # take a screenshot
    screencapture ~/tmp/screenshots/screen.png

    # Blur the screenshot image using ImageMagick
    # NSTexturedFullScreenBackgroundColor.png is the name for the login screen
    convert -resize 5% ~/tmp/screenshots/screen.png ~/tmp/screenshots/screensized.png
    convert -resize 1000% ~/tmp/screenshots/screensized.png ~/tmp/screenshots/com.apple.desktop.admin.png

    # replace the old lock screen picture with the new blurred one
    cp ~/tmp/screenshots/com.apple.desktop.admin.png /Library/Caches/com.apple.desktop.admin.png

    # lock the screen
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend

    sleep 5

    rm /Library/Caches/com.apple.desktop.admin.png
}
