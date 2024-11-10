# Color Setting
if [ -f ~/solarized/dircolors-solarized/dircolors.ansi-dark ]; then
    eval $(gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-dark)
fi

## ls color (for ubuntu)
if [ -f ~/.dircolors ]; then
  eval $(dircolors -b ~/.dircolors)
fi


# Locale Settings
## LANGを設定しとかないとwgetなどでエラーになる。
## デフォルト指定なしになる。ターミナルの設定（起動時にlocale設定）がうまく動いていない？
export LANG=en_US.UTF-8

# PATH Setting
#PATH=$(cat /etc/paths | tr -s "\n" ":") # defaultのPATH設定
#PATH=${PATH%:}

## /usr/local/sbin
if [[ ! $PATH =~ '/usr/local/sbin' ]]; then
  export PATH=$PATH:/usr/local/sbin
fi

## for Android SDK
if [[ ! $PATH =~ 'Eclipse' ]]; then
    [[ $(uname -a) =~ Mac ]]; export PATH=$PATH:/Applications/Eclipse/android-sdk/platform-tools
fi

## for nodebrew
if [[ ! $PATH =~ 'nodebrew' ]]; then
  export PATH=$PATH:~/.nodebrew/current/bin
fi

## for MacVim-kaoriya
if [[ ! $PATH =~ 'MacVim' ]]; then
  [[ $(uname -a) =~ Mac ]]; export PATH=/Applications/MacVim.app/Contents/bin:$PATH
fi

## for tfenv
if [[ ! $PATH =~ 'tfenv' ]]; then
  export PATH=$PATH:~/.tfenv/bin
fi

## for self make cmd
if [ ! $(echo $PATH | grep '~/bin/:') ]; then
  export PATH=~/bin:$PATH
fi

# EDITORをMacVim-kaoriya or vimに
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
else
    export EDITOR=/usr/bin/vim
fi

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

# bashrcの読み込み
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
