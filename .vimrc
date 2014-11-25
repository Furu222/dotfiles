"Color設定
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"文字コードの指定
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,enc-jp,cp932

"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルのディレクトリを指定
set backupdir=$HOME/vimbackup
"タブの代わりに空白文字を指定
set expandtab
"タブ幅の設定
set tabstop=4
set shiftwidth=4
"ルーラーを表示
set ruler
"タブや改行を表示
set nolist
"インクリメンタルサーチを行う
set incsearch
"行番号の表示
set number
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
"新しい行を作った時に高度な自動インデントを行う
set smarttab
"バックスペースでインデントや改行を削除できるように
set backspace=2
"検索時にファイルの最後までいったら最初に戻る
set wrapscan
"コマンドをステータス行に表示
set showcmd
" Esc Esc でハイライトOFF
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
" コマンドモードになる時に日本語OFF
set imdisable
" Swapファイルを使わない
set noswapfile

"---------------------------
"" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
" vim_startingでvim起動時のみ実行
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************
"Installed Plugins
"*****************
" NERDTree（ファイルをツリー型で表示）
NeoBundle 'scrooloose/nerdtree'
" autoclose(自動的に閉じ括弧を挿入)
NeoBundle 'Townk/vim-autoclose'
" quickrun(vimを開いたままコードを実行)
NeoBundle 'thinca/vim-quickrun'
" Unite(ファイルオープンを便利に)
NeoBundle 'Shougo/unite.vim'
" Unite(Unite.vimで最近使ったファイルを表示できるように)
NeoBundle 'Shougo/neomru.vim'
" UniteでGrep使えるように
NeoBundle 'Shougo/vimproc'
"*****************
"End Plugins
"*****************

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねる
NeoBundleCheck

""-------------------------
" End Neobundle Settings.
" "-------------------------

" "------------------------
" Start KeyMapping Settings.
" "------------------------

" Unit.vimの呼び出しを<Space>uにする
nnoremap [unite] <Nop>
nmap <Space>u [unite]
" NERDTreeの呼び出しを Ctrl + n にする
nnoremap <silent><C-n> :NERDTreeToggle<CR>

" "------------------------
" End KeyMapping Settings.
" "------------------------

" "------------------------
" Start Unit.vim Settings.
" "------------------------
" 入力モードで開始
let g:unite_enable_start_insert=1
" history/yankの有効化
let g:unite_source_history_yank_enable =1
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

" <Space>ucでUniteコマンド起動(カレントディレクトリ,バッファ、最近開いたファイル,ブックマークの順番で開く)
nnoremap <silent> [unite]f :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
" grep検索
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" ********************
" vim-grep settings
" ********************
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_max_candidates = 200
endif
" unite-grepのキーマップ
" 選択した文字列を /g でunite-grep
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>")

" "------------------------
" End Unit.vim Settings.
" "------------------------
