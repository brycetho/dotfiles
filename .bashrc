PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Bash autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Update all the things
alias brewup="sudo chown -R $(whoami) /usr/local/bin && brew update && brew upgrade && brew cask cleanup && brew cleanup&& osascript -e 'display notification \"Update finished\" with title \"Brew\"'"

alias update='sudo softwareupdate -iva'

# AWS autocomplete
complete -C '/usr/local/bin/aws_completer' aws

# Git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#AWS Profile
aws_profile() {
		$AWS_PROFILE
}

# Virtualenvwrapper config
export WORKON_HOME=$HOME/.virtualenvs/
source /usr/local/bin/virtualenvwrapper.sh

alias ap="export AWS_PROFILE=$1"

export PS1="\${aws_profile}\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

#set title to dir
export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"'

PATH="/Users/bthomsen/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/bthomsen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/bthomsen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/bthomsen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/bthomsen/perl6"; export PERL_MM_OPT;

HISTFILESIZE=
HISTSIZE=
