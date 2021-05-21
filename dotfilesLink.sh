#!/bin/sh

# zsh
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf /Users/tomo/.zprezto/runcoms/zshenv ~/.zshenv
ln -sf ~/dotfiles/prompt_tomo_setup ~/.zprezto/modules/prompt/functions/prompt_tomo_setup
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc

# tmux
ln -sf ~/dotfiles/.tmux.conf  ~/.tmux.conf

# git
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# karabiner-elements
ln -sf /Users/tomo/Dropbox/karabiner ~/.config/karabiner
