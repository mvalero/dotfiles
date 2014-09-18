# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

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
plugins=(git bundler brew gem rails ruby)

source $ZSH/oh-my-zsh.sh

# export EDITOR='mvim'

# Customize to your needs...
export PATH=$PATH:$HOME/.rvm/gems/ruby-1.9.3-p194@lbsi/bin:$HOME/.rvm/gems/ruby-1.9.3-p194@global/bin:$HOME/.rvm/rubies/ruby-1.9.3-p194/bin:$HOME/.rvm/bin:/usr/local/bin:./bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin
export PATH="./bin:$PATH" 

export PATH=/usr/local/bin:$PATH:/usr/local/mysql/bin
# export CC=/usr/bin/gcc
# export CC=/usr/local/Cellar/gcc46/4.6.4/bin/gcc-4.6
export PATH=/usr/local/bin:$PATH

alias tmux="TERM=screen-256color-bce tmux"
[ -n "$TMUX" ] && export TERM=screen-256color
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

setopt auto_cd
cdpath=($HOME/projects)

export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

alias gitx='open -a GitX .'
#
# # Customize to your needs...
# 
# # go to saved path if there is one
# if [[ -f ~/.current_path~ ]]; then
# cd `cat ~/.current_path~`
# rm ~/.current_path~
# fi
# 
# export PATH=/Developer/usr/bin:/Developer/usr/sbin:$PATH
# export PATH=$PATH:/usr/local/bin:/usr/local/mysql/bin
# export PATH=$PATH:/usr/local/share/npm/bin
# export NODE_PATH=/usr/local/lib/node:$NODE_PATH
# 
# [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
# 
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
# 
# 
# 
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# 
# ### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
# 

