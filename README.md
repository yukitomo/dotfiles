# dotfiles

#利用の仕方

```
git clone https://github.com/yukitomo/dotfiles.git
cd dotfileslink
bash dotfilesLink.sh
```

#zsh setting
- prezto install https://github.com/sorin-ionescu/prezto
- `~/.zpreztorc` で以下のように、テーマを指定

```
# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'tomo'
```


- 以下でprezto用にシンボリックリンクはる

```
ln -s ~/dotfiles/prompt_tomo_setup ~/.zprezto/modules/prompt/functions/prompt_tomo_setup
```


