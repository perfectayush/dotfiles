# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"
#ZSH_THEME="bira"

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(git zsh-syntax-highlighting archlinux ruby rvm virtualenvwrapper autojump)

source ~/.zlogin
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'

archbey -c green
alias fget="aria2c -c --max-connection-per-server=8 --min-split-size=1M"
alias e="emacsclient -t"
alias en="emacs -nw"
alias v="vim"
alias ssa="ssh -l ayush.go"
alias dsdb="udisksctl unmount --block-device /dev/sdb1;udisksctl unmount --block-device /dev/sdb2;udisks --detach /dev/sdb;"
alias zshconfig="emacsclient -t -a 'nano' ~/.zshrc"

export TERM=xterm-256color
export GREP_COLOR='1;35'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
