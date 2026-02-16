# Enable colors
color_prompt=yes

# === Functions ===
parse_git_branch() {
	branch=$(git symbolic-ref --short HEAD 2>/dev/null)
	if [ -n "$branch" ]; then
		echo "(%F{magenta}$branch%f)"
		return
	fi

	tag=$(git describe 2>/dev/null)
	if [[ -n $tag ]]; then
		echo "(%F{magenta}$tag%f)"
		return
	fi
}

setopt PROMPT_SUBST
if [[ "$color_prompt" == yes ]]; then
	NEWLINE=$'\n'
	EXIT_CODE='%(?.%F{white}.%F{red})%?%f'
	PS1="%B%F{green}%n@%m%f%b:%F{blue}%~%f \$(parse_git_branch) ${NEWLINE}(${EXIT_CODE}) >>> "
else
    PS1='%n@%m:%~$ '
fi

if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
	session="term-$(tty | tr -d /dev/pts/)"
	tmux attach -t "$session" 2>/dev/null || tmux new -s "$session" /usr/bin/zsh
fi

# --- GCC colors ---
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# === Aliases ===
if command -v dircolors &>/dev/null; then
	eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi


alias code="code -n"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g="git"
alias gs="git status"
alias gd="git diff"
alias gco="git checkout"
alias glog="git log --pretty=format:'%as %h %an %x09 %s' -n 20"

# Load additional aliases if present
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# === History ===
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=20000
setopt append_history
setopt share_history
setopt hist_ignore_all_dups

# === Misc ===
setopt nocaseglob       # case-insensitive globbing

# Bindings
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Zsh completions 
fpath=(/usr/share/zsh/functions/Completion $fpath)
autoload -Uz compinit && compinit
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# === Plugins ===
# Zsh autosuggestions (if installed)
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242,bold'
	ZSH_AUTOSUGGEST_STRATEGY=(history completion)

fi

# fzf
[ -f ~/.zsh/fzf.zsh ] && source ~/.zsh/fzf.zsh

export PATH=$PATH:/usr/local/go/bin
export PATH=/usr/local/nodejs/bin:$PATH


