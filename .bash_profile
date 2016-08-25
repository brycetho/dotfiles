#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#set title to dir
export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'

# Bash autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# GoLang
export PATH=$PATH:/usr/local/go/bin

# Update all the things
alias brewup="sudo chown -R $(whoami) /usr/local/bin && brew update && brew upgrade && brew cask cleanup && brew cleanup&& osascript -e 'display notification \"Update finished\" with title \"Brew\"'"

alias update='sudo softwareupdate -iva'

# AWS autocomplete
complete -C '/usr/local/bin/aws_completer' aws

# Git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

# Virtualenvwrapper config
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


alias ap="export AWS_PROFILE=$1"

# git aliases
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gl='git log'
alias gp='git pull'
alias gs='git status'
alias gcm='git commit -m'
alias gpo='git push origin '

# fuck
eval $(thefuck --alias)

# unlimited history
export HISTSIZE=
export HISTFILESIZE=

#AWS Profile

export AWS_HOME=~/.aws
function agp {
  echo $AWS_DEFAULT_PROFILE
}
function asp {
  local prompt=${PS1}
  export AWS_DEFAULT_PROFILE=$1
  export AWS_PROFILE=$1
  #export PS1="\$AWS_DEFAULT_PROFILE $prompt"
}

#Prompt
export PS1="\[\033[0;36m\]\$AWS_DEFAULT_PROFILE \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
