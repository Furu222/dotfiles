# Color Setting
eval $(gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-dark)

# rbenv, pyenv, plenv, phpenv Setting
eval "$(pyenv init -)"
eval "$(plenv init -)"
export PATH=$PATH:$HOME/.phpenv/bin
eval "$(phpenv init -)"
eval "$(rbenv init -)"

# Android SDKにパス通し
export PATH=$PATH:/Applications/Eclipse/android-sdk/platform-tools

# MacVim-kaoriyaを使うように設定(aliasもここでやっちゃう)
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# brew api token
if [ -f ~/.brew_api_token ];then
    source ~/.brew_api_token
fi

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# git-completion
source $HOME/dotfiles/.git-completion.bash
source $HOME/dotfiles/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# ターミナルの表示
# カレントディレクトリを表示,Gitのカレントブランチ名表示
export PS1="\[\033[34m\][\w]\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ "

# bashrcの読み込み
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
