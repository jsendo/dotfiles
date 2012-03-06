eval "$(rbenv init -)"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export GIT="ssh://git@git.btrll.com/home/git/repo"
export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
export JAVA_HOME=/Library/Java/Home

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
    export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
fi


if [ "$TERM" != "dumb" ]; then 
    export LS_OPTIONS='--color=auto' 
    eval `dircolors ~/.dir_colors`
fi  

# Useful aliases 
#alias la='gls $LS_OPTIONS -A'
alias ls='gls $LS_OPTIONS' 
alias ll='gls $LS_OPTIONS -lh' 
#alias l='gls $LS_OPTIONS -lAhF'
#alias cd..="cd .."
#alias c="clear"
#alias e="exit"
#alias ssh="ssh -X" 
#alias ..="cd .."
