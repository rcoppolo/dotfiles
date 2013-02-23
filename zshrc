# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
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
plugins=(git rails3 ruby brew rvm)

setopt auto_cd

# Things I don't want autocorrected
alias git cb='nocorrect git cb'
alias npm='nocorrect npm'
alias derby='nocorrect derby'
alias mongod='nocorrect mongod'
alias riak='nocorrect riak'
alias yaws='nocorrect yaws'
alias bx='bundle exec'

# alias git=hub
# eval "$(hub alias -s)"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/mongodb/bin:/Users/ryancoppolo/.rvm/gems/ruby-1.9.2-p290@gtcms/bin:/Users/ryancoppolo/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/ryancoppolo/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/ryancoppolo/.rvm/bin:/Users/ryancoppolo/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/share/python
export NODE_PATH=/usr/local/lib/node_modules
#export PATH=./.bundle/bin:$PATH
