bindkey -v
alias python=/usr/local/bin/python3.7
alias pip=/usr/local/bin/pip3.7
export MONGO_PATH=/usr/local/mongodb export
PATH=$PATH:$MONGO_PATH/bin:/Users/me/Library/Python/3.7/bin

alias vim='nvim'
alias gpl='git pull'
alias gl='git log'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gcam='git commit -am'
alias gr='git reset'
alias grp='git reset HEAD^'
alias grh='git reset --hard'
alias gp='git push'
alias gco='git checkout'
alias gst='git stash'
alias gstp='git stash pop'
export RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl@1.1

eval "$(rbenv init -)"
alias config='/usr/bin/git --git-dir=/Users/me/.cfg/ --work-tree=/Users/me'
