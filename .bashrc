###### alias #####
# ls関連
alias ls='gls -F --color=auto'
alias la='gls -aF --color=auto'
alias ll='gls -lFh --color=auto'
alias lal='gls -alFh --color=auto'

alias pbc='pbcopy'

# Use for MacVim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# Show Git-branch name in terminal
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\[\033[34m\][\w]\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ "
