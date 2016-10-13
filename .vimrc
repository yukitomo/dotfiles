
"for .psgi, .t 
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl

" edit settings
set clipboard+=unnamedplus  " share clipboard vim-mac
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする
set cursorline"         " 行番号、カーソルライン表示"
"インデント
set expandtab           "タブ入力を複数の空白入力に置き換える
set tabstop=4           "画面上でタブ文字が占める幅
set shiftwidth=4        "自動インデントでずれる幅
set softtabstop=4       "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する"
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start " バックスペースでなんでも消せるようにする
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く

"表示関係
"set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化

"ビープ音の停止
set visualbell


"検索
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set hlsearch            " 検索マッチテキストをハイライト

" for gf
set path+=~/fout/fout/
set path+=~/fout/fout_analysis
set path+=~/fout/fout_logs

" gf の縦分割
" http://yuheikagaya.hatenablog.jp/entry/2012/12/03/202556
nnoremap gs :vertical wincmd f<CR>

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

