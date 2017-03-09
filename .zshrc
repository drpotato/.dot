# ZSH
ZSH=~/development/oh-my-zsh
ZSH_THEME="potato-bira"
plugins=(brew cp docker git osx)
source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR="$(which code)"

# Remove default virtualenv from prompt:
VIRTUAL_ENV_DISABLE_PROMPT=true

# Exports
export LSCOLORS=GxfxbxdxCxegedabagacad
export ANSIBLE_INVENTORY=/etc/ansible/hosts
export MAVEN_OPTS="-Xmx1600M"
export PGPASSFILE="~/.pgpass"
export HOMEBREW_GITHUB_API_TOKEN="aeabde0997d0214d59e814dbd67dc9d4c0103599"
export MACHINE_GITHUB_API_TOKEN="7d4047731000ed6a6242bb3fa85457f438dad0b8"

# Homebrew Stuff
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# NVM Stuff
export NVM_DIR="$HOME/.nvm"
source /usr/local/opt/nvm/nvm.sh

# Python Stuff
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/development
source /usr/local/bin/virtualenvwrapper.sh

# Ruby Stuff
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# LaTex Stuff
export PATH=$PATH:/usr/local/texlive/2016/bin/universal-darwin

# Go Stuff
export GOPATH=$HOME/development/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin

# Ruby Stuff
source $HOME/.rvm/scripts/rvm

# Atlassian Stuff
export ATLASSIAN_DIR=/Users/cmorgan/development/atlassian
export ATLASSIAN_SCRIPTS=$ATLASSIAN_DIR/atlassian-scripts
source $ATLASSIAN_DIR/atlassian-scripts/sourceme.sh
. $ATLASSIAN_DIR/awscli-saml-auth/bashrc_additions
export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME=`/usr/libexec/java_home -v1.8`
export PATH=$PATH:$ATLASSIAN_DIR/bizbox/scripts/host/bin:$ATLASSIAN_DIR/bizbox/scripts/common/bin:$ATLASSIAN_DIR/pulse-scripts/bin:$ATLASSIAN_DIR/intsys-deployment:$ATLASSIAN_DIR/nanos:$ATLASSIAN_DIR/scripts
export USER_HOME=$HOME
export OMG_HOME=$ATLASSIAN_DIR/omg
export BILLING_SERVICE_HOME=$ATLASSIAN_DIR/billing-service
# export NANOS_MACHINE=bizbox
# if [ $(docker-machine status $NANOS_MACHINE) != "Running" ]; then
#     ( ( docker-machine start $NANOS_MACHINE; eval $(docker-machine env $NANOS_MACHINE) ) & ) > /dev/null 2>&1
# else
#     eval $(docker-machine env $NANOS_MACHINE)
# fi

# Command Editing
autoload -U edit-command-line

eval "$(jenv init -)"

# Turn off annoying zsh autocorrect
unsetopt correct_all
unsetopt AUTO_CD

# Aliases:
alias fuck='sudo $(fc -ln -1)'
alias mci='mvn clean install'
unalias gb

# Simple funcitons:
function gi() { curl -s https://www.gitignore.io/api/${(j:,:)@} ;}
function gocd() { cd `go list -f '{{.Dir}}' $1` }
texcompile() {
	pdflatex $1
	bibtex $1
	pdflatex $1
	pdflatex $1
}
