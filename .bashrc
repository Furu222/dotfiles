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

# sudoコマンド打った時にenv-reset
# sudo時alias引き継ぎ（' 'を最後に入れることで指定コマンド後にもaliasを利用する）
alias sudo='sudo -E '

# Exclusion php/python env config file
## brew doctorのWarningを消す
alias brew="env PATH=${PATH/\/Users\/furudate\/\.*env\/shims:/} brew"

# Show Git-branch name in terminal
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\[\033[34m\][\w]\[\033[31m\]\$(__git_ps1)\[\033[00m\]\\$ "
