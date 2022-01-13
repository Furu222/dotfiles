###### alias ######
# ls関連
if type "gls" > /dev/null 2>&1
then
    # for mac
    alias ls='gls -F --color=auto'
    alias la='gls -aF --color=auto'
    alias ll='gls -lFh --color=auto'
    alias lal='gls -alFh --color=auto'
    alias lla='lal'
    alias llt='gls -Flth --color=auto'
    alias lltr='gls -Flthr --color=auto'
    alias llat='gls -Flath --color=auto'
    alias llatr='gls -Flathr --color=auto'
    alias lalt='gls -Flath --color=auto'
    alias laltr='gls -Flathr --color=auto'
else
    # for windows
    alias ls='ls -F --color=auto'
    alias la='ls -aF --color=auto'
    alias ll='ls -lFh --color=auto'
    alias lal='ls -alFh --color=auto'
    alias lla='lal'
    alias llt='ls -Flth --color=auto'
    alias lltr='ls -Flthr --color=auto'
    alias llat='ls -Flath --color=auto'
    alias llatr='ls -Flathr --color=auto'
    alias lalt='ls -Flath --color=auto'
    alias laltr='ls -Flathr --color=auto'
fi

# move '..' parent directory
alias ..='cd ..'
# check overwrite mv & cp
alias mv='mv -i'
alias cp='cp -i'

# pbcopy and pbpaste
## pbcopy for ubuntu
if type "clip.exe" > /dev/null 2>&1
then
  alias pbcopy='clip.exe'
fi
## pbpaste for ubuntu
if type "powershell.exe" > /dev/null 2>&1
then
  alias pbpaste="powershell.exe -command 'Get-Clipboard'"
fi

alias pbc='pbcopy'
alias pbp='pbpaste'

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

# sudo completion
complete -cf sudo

# terraform completion
complete -C /usr/local/bin/terraform terraform
##### End Completion #####


##### Start History Command #####
HISTTIMEFORMAT='%F %T '
HISTSIZE=100000
HISTFILESIZE=100000
#HISTIGNORE='history:pwd:ls:ls *:ll:w:top:df *'
HISTCONTROL=ignoreboth # 直前と重複したものは記録しない(ignoredups), スペースで始まるコマンドを無視(ignorespace)
PROMPT_COMMAND='history -a; history -c; history -r' # 履歴のリアルタイム反映
##### End History Command #####


##### Start PS1#####
## show git branch * status
GIT_PS1_SHOWDIRTYSTATE=true
## show terraform workspace
function __terraform_ps1() {
  if [ -d .terraform ]; then
    tf_workspace="$(terraform workspace show 2>/dev/null)"
    echo " (${tf_workspace})"
  fi
}

#export PS1="\[\033[34m\][\w]\[\033[31m\]\$(__git_ps1)\[\033[00m\]\\$ " # non-terraform
export PS1="\[\033[34m\][\w]\[\033[31m\]\$(__git_ps1)\[\033[35m\]\$(__terraform_ps1)\[\033[00m\]\\$ "
##### End PS1#####

##### Start Other Settings #####
# Windowサイズ変更時LINEとCOLUMNSの値を自動調整
shopt -s checkwinsize
# lesspipeでnon-text file でもlessできるように
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# chrootしたときに変数に格納
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# color settings
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
# Ubuntu設定
## Add an "alert" alias for long running commands.  Use like so:
##   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
##### End Other Settings #####
