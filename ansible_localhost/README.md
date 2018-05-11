# ansible_localhost
- 全くコマンドラインでの設定がされていないPCに各種ApplicationのインストールをAnsibleを使って行う

### Ansible の Install

- Ansible を使うための諸々のインストール
- このリポジトリを local に書き出し

```
# xcode 準備
FO-646:~ tomo$ sudo xcodebuild -license

# home-brew install
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install git
$ brew install git

# dotfiles リポジトリ の clone
$ cd ~
$ git clone git@github.com:yukitomo/dotfiles.git

# pip & ansible インストール
$ bash InstallAnsible.sh
```

### ansible-playbook を使って実行

```
# Application のInstall先を指定。zsh を使う場合は zshrc に記載
$ echo 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"' >> ~/.bash_profile
$ source ~/.bash_profile

# ansible playbook の実行
$ ansible-playbook -i hosts localhost.yml --ask-sudo-pass
```
