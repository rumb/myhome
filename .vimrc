
""""""""""""""""""""""""""""""
" オリジナル設定
""""""""""""""""""""""""""""""
" エンコード自動判別
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
" 外部でファイルに変更がされた場合は読みなおす
set autoread
" swapfile有効化
set swapfile
set directory=$HOME/.vim/swap
" backup有効化
set backup
set writebackup
set backupdir=$HOME/.vim/backup
" ファイル名補完有効
set infercase
" 補完モード
set wildmode=list:longest,full
"補完モード
" ""              最初のマッチのみを補完する。
" "full"          次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
" "longest"       共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
" "longest:full"  "longest" と似ているが、'wildmenu' が有効ならばそれを開始する
" "list"          複数のマッチがあるときは、全てのマッチを羅列する。
" "list:full"     複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する

" MacVim用設定
if has('gui_macvim')
  set transparency=10
  set guioptions-=T
endif

set clipboard+=unnamed
set clipboard+=autoselect
" スペース消去
autocmd BufWritePre * :%s/\s\+$//ge
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
set selection=inclusive
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バッファで開いているファイルのディレクトリでエクスクローラを開始する
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on

if executable('g++49')
  let g:syntastic_cpp_compiler = 'g++49'
  let g:syntastic_cpp_compiler_options = '-std=c++11 -Wl,-rpath=/usr/local/lib/gcc49/ -fdiagnostics-color=always'
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" オリジナル設定
""""""""""""""""""""""""""""""
" カラースキーム
colorscheme molokai
" 背景色無効化
highlight Normal      ctermbg=none
highlight NonText     ctermbg=none
highlight LineNr      ctermfg=darkyellow ctermbg=none
highlight Folded      ctermbg=none
highlight visual      ctermbg=22

""""""""""""""""""""""""""""""

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
let g:neobundle_default_git_protocol='https'

NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'sudo.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jelera/vim-javascript-syntax' " javascript
NeoBundle 'hail2u/vim-css3-syntax' " css3
NeoBundle 'vim-scripts/css_color.vim' " Hexコードをその色で表示
NeoBundle 'taichouchou2/html5.vim' " html5
NeoBundle 'tpope/vim-markdown' " markdown
NeoBundle 'sjl/gundo.vim' " Undoのビジュアル表示
NeoBundle 'smartchr' " smartchr.vim : ==などの前後を整形
NeoBundle 'Align' " Align : 高機能整形・桁揃えプラグイン
NeoBundle 'h1mesuke/vim-alignta' " マルチバイト対応の整形
NeoBundle 'bronson/vim-trailing-whitespace' " 行末の半角スペースを可視化
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'octol/vim-cpp-enhanced-highlight' " C++シンタックスハイライト

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=235
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=237 let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=2

" C++シンタックスハイライト
let g:cpp_class_scope_highlight = 1

