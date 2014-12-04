# Color Setting
eval $(gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-dark)

# rbenv, pyenv, plenv Setting
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(plenv init -)"

# カレントディレクトリを表示
export PS1="[\w]\\$ "
# Android SDKにパス通し
export PATH=$PATH:/Applications/Eclipse/android-sdk/platform-tools

# MacVim-kaoriyaを使うように設定(aliasもここでやっちゃう)
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# bashrcの読み込み
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
