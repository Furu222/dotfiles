" Color Setting
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Encoding Setting
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,enc-jp,cp932

" 新しい行のインデントを現在行と同じに
set autoindent
" タブを空白文字に
set expandtab
" タブ幅の設定
set tabstop=4
set shiftwidth=4
" ルーラーを表示
set ruler
" タブや改行を表示
set nolist
" インクリメンタルサーチ
set incsearch
" 行番号の表示
set number
" 対応する括弧を強調
set showmatch
" 自動インデント
set smarttab
" バックスペースでインデントや改行を削除
set backspace=2
"検索時にファイルの最後までいったら最初に戻る
set wrapscan
" コマンドをステータス行に表示
set showcmd
" Esc Esc でハイライトOFF
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>

set imdisable
set guioptions=T
set antialias
set nobackup
set visualbell t_vb=
set columns=100
set lines=48

" 全角入力したときにハイライト
if has('multi_byte_ime') || has('xim') 
    highlight Cursor guifg=NONE guibg=White
    highlight CursorIM guifg=NONE guibg=DarkRed
endif
