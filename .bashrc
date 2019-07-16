###### alias ######
# ls関連
alias ls='gls -F --color=auto'
alias la='gls -aF --color=auto'
alias ll='gls -lFh --color=auto'
alias lal='gls -alFh --color=auto'

# move '..' parent directory
alias ..='cd ..'
# check overwrite mv & cp
alias mv='mv -i'
alias cp='cp -i'

# pbcopy
alias pbc='pbcopy'

# MacVim(require PATH to MacVim
alias vim='env LANG=ja_JP.UTF-8 vim "$@"'
alias vi=vim
alias view='env LANG=ja_JP.UTF-8 view "$@"'
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/bin/vim "$@"'
#alias view='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/bin/view "$@"'

# git
alias gs='git status'

# sudoコマンド打った時にenv-reset
## sudo時alias引き継ぎ（' 'を最後に入れることで指定コマンド後にもaliasを利用する）
alias sudo='sudo -E '

# for perl/python env
## brew doctorのWarningを消すためbrew実行時は ~/*env/shims をPATHから除外(PATH/before/after/の形式でリプレイスしている（この場合Afterは未指定）。
alias brew="env PATH=${PATH/\/Users\/furudate\/\.*env\/shims:/} brew"
###### alias ######

# sudo completion
complete -cf sudo

# Show Git-branch name in terminal
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\[\033[34m\][\w]\[\033[31m\]\$(__git_ps1)\[\033[00m\]\\$ "
