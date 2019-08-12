# Color Setting
eval $(gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-dark)

# PATH Setting
#PATH=$(cat /etc/paths | tr -s "\n" ":") # defaultのPATH設定
#PATH=${PATH%:}

## /usr/local/sbin
if [ ! $(echo $PATH | grep '/usr/local/sbin') ]; then
  export PATH=$PATH:/usr/local/sbin
fi

## for Android SDK
if [ ! $(echo $PATH | grep 'Eclipse') ]; then
  export PATH=$PATH:/Applications/Eclipse/android-sdk/platform-tools
fi

## for nodebrew
if [ ! $(echo $PATH | grep 'nodebrew') ]; then
  export PATH=$PATH:~/.nodebrew/current/bin
fi

## for MacVim-kaoriya
if [ ! $(echo $PATH | grep 'MacVim') ]; then
  export PATH=/Applications/MacVim.app/Contents/bin:$PATH
fi

# EDITORをMacVim-kaoriyaに。
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# brew api token
if [ -f ~/.brew_api_token ];then
    source ~/.brew_api_token
fi

# rbenv, pyenv, plenv Setting
if [ -z $PYENV_SHELL ]; then
  eval "$(pyenv init -)"
fi
if [ -z $PLENV_SHELL ]; then
  eval "$(plenv init -)"
fi
if [ -z $RBENV_SHELL ]; then
  eval "$(rbenv init -)"
fi

# nvm migration to nodebrew
# nvm
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

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
