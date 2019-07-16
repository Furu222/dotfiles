" Color設定
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" 文字コードの指定
set enc=utf-8
set fenc=utf-8
set fencs=ucs-bom,iso-2022-jp,sjis,cp932,euc-jp,cp20932,utf-8

" backup/swap/undoディレクトリ指定
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap
set undodir=$HOME/.vim/undo

" 表示
"" ルーラーを表示
set ruler
"" タブや改行を表示
set nolist
"" 行番号の表示
set number
"" 閉括弧が入力された時、対応する括弧を強調する
set showmatch
"" コマンドをステータス行に表示
set showcmd
"" 補完メニューの表示幅を10にする
set pumheight=10
"" ウィンドウの幅より長い場合折り返す
set wrap
"" 折り返すときに区切りのいいところで折り返す
""" breakatで折り返す文字の指定が可能
set linebreak
"" 折り返した行に記号をつける
"set showbreak=+\  
"" 折り返した行のインデントを合わせる
set breakindent

" インデント設定
"" タブの代わりにスペース
set expandtab
"" 通常時とインデント時のタブ幅
set tabstop=2
set shiftwidth=0
"" shiftwidth分自動インデント&削除
set smarttab
"" 自動インデント
set autoindent
"" 高度なインデント
set smartindent
"" ファイルタイプによってインデント変更
augroup fileTypeIndent
  autocmd!
  autocmd FileType json setlocal tabstop=4
augroup END
"" バックスペースでautoindentを超えて削除&行の連結（前の行も削除可能）
set backspace=2

" 検索設定
"" インクリメンタルサーチを行う
set incsearch
"" 検索時にファイルの最後までいったら最初に戻る
set wrapscan
"" 大文字小文字無視
set ignorecase
"" 大文字が入っている場合のみignorecase=OFF
set smartcase

" クリップボード共有
set clipboard+=unnamed
set clipboard+=autoselect

" quickrun実行時に出力バッファへカーソルを移動
let g:quickrun_config = {
\   "_":{
\       "outputter/buffer/into":1,
\   },
\}

" "------------------------
" Start KeyMapping Settings.
" "------------------------
" Unit.vimの呼び出しを<Space>uにする
nnoremap [unite] <Nop>
nmap <Space>u [unite]
" NERDTreeの呼び出しを Ctrl + n にする
nnoremap <silent><C-n> :NERDTreeToggle<CR>
" Esc Esc でハイライトOFF
nnoremap <Esc><Esc> :nohlsearch<CR>
" Yを行全体をヤンクするように
nnoremap Y y$
" 数字のインクリメント・デクリメントをC-+, C--にする
nnoremap + <C-a>
nnoremap - <C-x>
" Shift Tabで逆インデント
nnoremap <S-tab> <<
inoremap <S-tab> <C-d>
" Tabでインデント（Normarlモード時）
nnoremap <Tab> >>
" "------------------------
" End KeyMapping Settings.
" "------------------------

" "--------------------------------
" Start Visualization ZenkakuSpace
" "--------------------------------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermbg=LightMagenta guibg=LightMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
" "--------------------------------
" End Visualization ZenkakuSpace
" "--------------------------------

"---------------------------
"" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
" vim_startingでvim起動時のみ実行
if has('vim_starting')
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

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
" vimでgistアップロードできるように
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
" vimでMarkdownのプレビュー
NeoBundle 'kannokanno/previm'
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


" "------------------------
" Start previm Settings.
" "------------------------

" mdファイルに対応
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'open -a Google\ Chrome'
" <Space> p でprevim開いて <Space> p + o でブラウザ開く、<Space> p + r でリロード
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

" "------------------------
" " End previm Settings.
" " "------------------------
