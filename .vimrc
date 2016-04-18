
"--------------------------
" Neobundle Init.
"---------------------------
"Vim の起動時に NeoBundle がなかった場合にのみ実行できる
":NeoBundleInit というコマンドを定義

let $VIMBUNDLE = '~/.vim/bundle'
let $NEOBUNDLEPATH = $VIMBUNDLE . '/neobundle.vim'
if stridx(&runtimepath, $NEOBUNDLEPATH) != -1
" If the NeoBundle doesn't exist.
command! NeoBundleInit try | call s:neobundle_init()
            \| catch /^neobundleinit:/
                \|   echohl ErrorMsg
                \|   echomsg v:exception
                \|   echohl None
                \| endtry

function! s:neobundle_init()
    redraw | echo "Installing neobundle.vim..."
    if !isdirectory($VIMBUNDLE)
        call mkdir($VIMBUNDLE, 'p')
        echo printf("Creating '%s'.", $VIMBUNDLE)
    endif
    cd $VIMBUNDLE

    if executable('git')
        call system('git clone git://github.com/Shougo/neobundle.vim')
        if v:shell_error
            throw 'neobundleinit: Git error.'
        endif
    endif

    set runtimepath& runtimepath+=$NEOBUNDLEPATH
    call neobundle#rc($VIMBUNDLE)
    try
        echo printf("Reloading '%s'", $MYVIMRC)
        source $MYVIMRC
    catch
        echohl ErrorMsg
        echomsg 'neobundleinit: $MYVIMRC: could not source.'
        echohl None
        return 0
    finally
        echomsg 'Installed neobundle.vim'
    endtry

    echomsg 'Finish!'
endfunction

autocmd! VimEnter * redraw
            \ | echohl WarningMsg
            \ | echo "You should do ':NeoBundleInit' at first!"
            \ | echohl None
endif

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"カラースキームに関しての設定は一番下に書く
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'

" NERDTreeを設定                 
NeoBundle 'scrooloose/nerdtree' 

"autoclose:括弧保管
NeoBundle 'Townk/vim-autoclose'

"quickrun:ちょっとしたコード片を書いて実行して確認
"NeoBundle 'thinca/vim-quickrun'

"grep.vim:ディレクトリを再帰的にgrep,ファイルopen
"NeoBundle 'grep.vim'

"検索
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"編集関係
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする
"インデント
set expandtab           "タブ入力を複数の空白入力に置き換える
set tabstop=4           "画面上でタブ文字が占める幅
set shiftwidth=4        "自動インデントでずれる幅
set softtabstop=4       "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する"

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
"if has('unnamedplus')
    " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
"    set clipboard& clipboard+=unnamedplus,unnamed 
"else
    " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
"    set clipboard& clipboard+=unnamed
"endif

" Swapファイル？Backupファイル？前時代的すぎ
" なので全て無効化する
set nowritebackup
set nobackup
set noswapfile

"表示関係
set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる


" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲ 
set listchars=tab:>-,trail:-
"python用プラグイン
"NeoBundle 'Flake8-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

"pyflake setting
"保存時に自動でチェック
"let g:PyFlakeOnWrite = 1
"let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
"let g:PyFlakeDefaultComplexity=10

"syntactic
"let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" rename用のマッピングを無効にしたため、代わりにコマンドを定義
"command! -nargs=0 JediRename :call jedi#rename()

" pythonのrename用のマッピングがquickrunとかぶるため回避させる
"let g:jedi#rename_command = ""
"let g:jedi#pydoc = "k"

call neobundle#end()

" Required:
filetype plugin indent on

"カラースキーム
syntax enable
set background=dark
colorscheme solarized

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------
"viminfoを用いて異なるウィンドウのvimのヤンクデータを共有
"http://shirakiya.hatenablog.com/entry/2015/01/30/025257
"-------------------------
let OSTYPE = system('uname')
if OSTYPE == "Linux\n"
    noremap y y:wv<CR>
    noremap p :rv!<CR>p
endif
set viminfo='50,\"3000,:0,n~/.viminfo'

"-------------------------
"クリップボードとvimを連携（Macのみ必要）
"------------------------
set clipboard+=unnamed
"
