# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="michelebologna"

plugins=(git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

parse_git_branch() {
    local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
    if [ -n "$branch" ]; then
        local git_status=""
        local ahead=$(git rev-list --count HEAD...origin/$(git branch --show-current) 2>/dev/null | tail -1)
        local behind=$(git rev-list --count origin/$(git branch --show-current)...HEAD 2>/dev/null | tail -1)
        
        if [ "$ahead" -gt 0 ] && [ "$behind" -gt 0 ]; then
            git_status="<>"
        elif [ "$ahead" -gt 0 ]; then
            git_status=">"
        elif [ "$behind" -gt 0 ]; then
            git_status="<"
        else
            git_status="="
        fi
        
        echo "%{$fg_bold[green]%}${branch%?}$git_status)%{$reset_color%}"
    fi
}

# terminal line prefix config
export PROMPT='%{$fg_bold[blue]%}%~%{$reset_color%}$(parse_git_branch) '

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
alias uuid="python3 -c \"import uuid; print(uuid.uuid4())\""