# Color Setting
eval $(gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-dark)

# PATH Setting
#PATH=$(cat /etc/paths | tr -s "\n" ":") # defaultのPATH設定
#PATH=${PATH%:}

## /usr/local/sbin
export PATH=$PATH:/usr/local/sbin

## for Android SDK
export PATH=$PATH:/Applications/Eclipse/android-sdk/platform-tools

## for MacVim-kaoriya
export PATH=/Applications/MacVim.app/Contents/bin:$PATH

# EDITORをMacVim-kaoriyaに。
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# brew api token
if [ -f ~/.brew_api_token ];then
    source ~/.brew_api_token
fi

# rbenv, pyenv, plenv Setting
eval "$(pyenv init -)"
eval "$(plenv init -)"
eval "$(rbenv init -)"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# git-completion
if [ -f "${HOME}/dotfiles/.git-completion.bash" -a -f "${HOME}/dotfiles/.git-prompt.sh" ] ; then
    source $HOME/dotfiles/.git-completion.bash
    source $HOME/dotfiles/.git-prompt.sh
fi

# bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# bashrcの読み込み
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
