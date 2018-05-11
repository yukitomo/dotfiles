# dotfiles
- 全く設定のされていないPCに対しては `dotfiles/ansible_localhost` で事前にApplication をInstallする
- https://github.com/yukitomo/dotfiles/tree/master/ansible_localhost


## 利用の仕方

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


