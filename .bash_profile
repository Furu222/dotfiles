# Color Setting
eval $(gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-dark)

PATH=$(cat /etc/paths | tr -s "\n" ":") # defaultのPATH設定
PATH=${PATH%:}
# rbenv, pyenv, plenv, phpenv Setting
eval "$(pyenv init -)"
eval "$(plenv init -)"
export PATH=$PATH:$HOME/.phpenv/bin
eval "$(phpenv init -)"
eval "$(rbenv init -)"

# Android SDKにパス通し
export PATH=$PATH:/Applications/Eclipse/android-sdk/platform-tools

# /usr/local/sbin
export PATH=$PATH:/usr/local/sbin

# MacVim-kaoriyaを使うように設定
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

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

# bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# bashrcの読み込み
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
