# Aliases
alias g="git"
alias gs="git status"
alias gd="git diff"
alias glog="git log --pretty=format:'%h %an %s' -n 20"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Functions
parse_git_branch() {
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch)"
    fi
}

# Misc
shopt -s nocaseglob
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

HISTSIZE=10000
HISTFILESIZE=20000

shopt -s checkwinsize

