# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="michelebologna"

plugins=(git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# terminal line prefix config
export PROMPT='%{$fg_bold[blue]%}%~%{$reset_color%}$(michelebologna_git_prompt) '

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias rst="source ~/.zshrc"
alias gcm="git checkout develop"
alias gcnb="git checkout -b"
alias gc="git checkout"
alias gpm="git pull origin develop"
alias gm="git merge"
alias gs="git stash"
alias gsa="git stash apply"
alias gsub="git submodule update --recursive"
alias c="cursor ."