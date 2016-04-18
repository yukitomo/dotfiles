
# dotfiles

#利用の仕方
git clone https://github.com/yukitomo/dotfiles.git

cd dotfiles

bash dotfilesLink.sh

#NEObundleのインストール
mkdir -p ~/.vim/bundle

git clone hittps://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

vimの起動

#zsh setting

Oh-my-zshのDL

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

vim .zshrc

change ZSH_THEME="wezm"
