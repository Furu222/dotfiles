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

# MacVim(require PATH to MacVim)
alias vim='env LANG=ja_JP.UTF-8 vim "$@"'
alias vi='vim'
alias view='env LANG=ja_JP.UTF-8 view "$@"'
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/bin/vim "$@"'
#alias view='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/bin/view "$@"'

# git
alias gs='git status'
alias gst='gs'
alias ga='git add ./'
alias gaa='git add "$@"'
alias gc='git commit'
alias gm='gc'
alias gcm='git commit -m "$@"'
alias gmm='gcm'
alias gp='git push'
alias gpl='git pull'

# echo $PATH
alias PATH='echo $PATH | tr -s ":" "\n"'
alias path='echo $PATH | tr -s ":" "\n"'
alias PATHS='echo $PATH | tr -s ":" "\n" | sort'
alias paths='echo $PATH | tr -s ":" "\n" | sort'

# sudoコマンド打った時にenv-reset
## sudo時alias引き継ぎ（' 'を最後に入れることで指定コマンド後にもaliasを利用する）
alias sudo='sudo -E '

# brew
## for perl/python env
## brew doctorのWarningを消すためbrew実行時は ~/*env/shims をPATHから除外(PATH/before/after/の形式でリプレイスしている（この場合Afterは未指定）。
alias brew='env PATH=${PATH/\/Users\/furudate\/\.*env\/shims:/} brew'

## brew cask
alias brewc='brew cask'
###### End alias ######


##### Start Completion #####
# git-completion
if [ -f "${HOME}/dotfiles/.git-completion.bash" -a -f "${HOME}/dotfiles/.git-prompt.sh" ] ; then
    source $HOME/dotfiles/.git-completion.bash
    source $HOME/dotfiles/.git-prompt.sh
fi

# bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/furudate/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
##### End Completion #####


# sudo completion
complete -cf sudo

# Show Git-branch name in terminal
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\[\033[34m\][\w]\[\033[31m\]\$(__git_ps1)\[\033[00m\]\\$ "
