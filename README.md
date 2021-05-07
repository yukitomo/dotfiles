# 環境構築の大枠
- 1. Homebrew Bundle で Application をインストール
- 2. 各種設定ファイルの同期 & 読み込み

## 1. Homebrew Bundle で Application をインストール

- homebrew をインストール https://brew.sh/index_ja
- 本リポジトリ以下の `./Brewfile` を対象のPCに準備
- 以下コマンドを実行し、各種 Application をインストール
    - 参考 : https://www.karakaram.com/how-to-automate-your-mac-set-up/

```
$ brew bundle
```

## 2. 各種設定 ファイルの同期 & 読み込み

- 本リポジトリを clone する
- 対象PCで Dropbox にログインし、private な config ファイル & その他を同期しておく
    - `~/Dropbox/zshrc_private`
    - `Dash`, `karabiner`, `Quiver.qvlibrary` etc...

### zsh & prezto の設定
- zsh は prezto で管理する。以下のようにInstall https://github.com/sorin-ionescu/prezto

```
# zsh を起動
$ zsh
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 設定ファイルを作成
$ setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Shellのデフォルトに設定
$ chsh -s /bin/zsh
```

### 各種 dotfiles へのsymbolic-link 作成
- 以下の処理で、tmux, zsh, neovim(zshrc内に記載) の dotfiles が適用される

```
$ bash dotfilesLink.sh
```
- neovim へのconfigファイルの適用は起動時に以下のコマンドを叩く

```
$ :call dein#install()
```

### private な config について
- 以下の実装で private な設定はDropbox以下のファイルから読み込まれる
- https://github.com/yukitomo/dotfiles/blob/e7c660703983817421237c1e0e8c5388b5d0a363/zshrc#L55-L68

```
# loading private settings
function source_file {
  if [ $# -lt 1 ];then
    echo "ERROR!!! source_file is called w/o an argument"
    return
  fi
  arg="$1"
  shift
  if [ -r "$arg" ]; then
    source "$arg"
  fi
}

source_file ~/Dropbox/zshrc_private
```
