#the following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/shane/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep nomatch
#bindkey -v
# End of lines configured by zsh-newuser-install
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# just bundle antigen with the .dotfiles, saves our asses anyways...
[ -f ~/bin/antigen.zsh ] && source ~/bin/antigen.zsh


antigen use oh-my-zsh
antigen bundle git
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen apply

export EDITOR="vim"
