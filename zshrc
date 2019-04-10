#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:/usr/local/bin/"
eval "$(pyenv init -)"
export MANPATH="/usr/local/man:$MANPATH"

export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH=$HOME/perl5/bin:$PATH;
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;
export XDG_CONFIG_HOME="$HOME/dotfiles" # for neovim
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# aliases
# example: alias hoge='cat ~/.zshrc'
eval "$(hub alias -s)"

# alias
alias nv='nvim'
alias vim='nvim'
# copy current branch
alias ccb='echo `git symbolic-ref --short HEAD` | tr -d "\n" ``| pbcopy; pbpaste ; echo ""'

# for tmux
# http://d.hatena.ne.jp/tokorom/20110417/1303005418
alias tmux-changekey='tmux set-option -ag prefix C-b'
alias tmux-revertkey='tmux set-option -ag prefix C-t'

# git関連
alias g='git'
alias glog='git log --oneline --graph'
alias gitconfig='cat ~/.gitconfig'

#ビープ音の削除
setopt no_beep

# ctrl+a, e など
bindkey -e

# plenv initialize
eval "$(plenv init -)"

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

eval "$(pyenv init -)"
