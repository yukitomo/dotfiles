# dotfiles
- 全く設定のされていないPCに対しては `dotfiles/ansible_localhost` で事前にApplication をInstallする
- https://github.com/yukitomo/dotfiles/tree/master/ansible_localhost


## 利用の仕方

- 以下の実行には, zsh, neovim, tmux の Install が事前にされている必要がある

### prezto の準備
- zshはpreztoで管理する。以下のようにInstall https://github.com/sorin-ionescu/prezto

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

### 備考
- 以下の実装で private な設定はDropbox以下のファイルから読み込むように設定
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
