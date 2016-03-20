ZSH=$HOME/development/oh-my-zsh
ZSH_THEME="potato-bira"

plugins=(aws cp docker git go node npm pip python sudo)

# Turn off annoying zsh autocorrect
unsetopt correct_all
VIRTUAL_ENV_DISABLE_PROMPT=true

source $ZSH/oh-my-zsh.sh

# Exports
export LSCOLORS=GxfxbxdxCxegedabagacad
export GOPATH=$HOME/development/go

# Add things to path
export PATH=$PATH:$GOPATH/bin

# Aliases:
unalias gb
alias fuck='sudo $(fc -ln -1)'

