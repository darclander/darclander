# Aliases
alias g="git"
alias gs="git status"
alias gd="git diff"
alias glog="git log --pretty=format:'%h %an %s' -n 20"

# Misc
shopt -s nocaseglob

# Functions

parse_git_branch() {
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch)"
    fi
}

