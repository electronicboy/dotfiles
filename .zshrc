zmodload zsh/zprof
#zmodload zsh/datetime
#setopt PROMPT_SUBST
#PS4='+$EPOCHREALTIME %N:%i> '

#logfile=$(mktemp zsh_profile.XXXXXXXX)
#echo "Logging to $logfile"
#exec 3>&2 2>$logfile

#setopt XTRACE

#the following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/shane/.zshrc'
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep nomatch
# fix some support for shell scripts that rely on this behavior
#bindkey -v
# End of lines configured by zsh-newuser-install

export PATH="/usr/local/opt/ruby/bin:$PATH:$HOME/.bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/go/bin:/snap/bin:/Users/shane/Library/Python/2.7/bin"

export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/qt/bin:$PATH"

# just bundle antigen with the .dotfiles, saves our asses anyways...
[ -f ~/.bin/antigen.zsh ] && source ~/.bin/antigen.zsh

# apparently this isn't set when on SSH...
# (breaks ssh and the omzsh git integration)
export LC_ALL=en_US.UTF-8

BULLETTRAIN_PROMPT_ORDER=(
time
context
dir
git
)

antigen use oh-my-zsh
antigen bundle git
#antigen bundle mvn
#antigen bundle command-not-found
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen apply

export EDITOR="vim"
setopt shwordsplit

alias gds='git diff --staged'

if command -v eza > /dev/null; then
  alias ls='eza'
  alias l='eza -lbF --git'
  alias ll='eza -lbGF --git'
  alias llm='eza -lbGd --git --sort=modified'
  alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'
  alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'

  # specialty views
  alias lS='eza -1'
  alias lt='eza --tree --level=2'
  alias l.="eza -a | grep -E '^\.'"
fi

#unsetopt XTRACE
#exec 2>&3 3>&-

# Created by `pipx` on 2021-06-29 19:59:24
export PATH="$PATH:/Users/shane/.local/bin"
export GPG_TTY=$(tty)


#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi

alias work="cd /Volumes/shanework/work"

graal() {
export PATH="/Users/shane/graalvm-ce-java17-22.3.1/Contents/Home/bin:$PATH"
export JAVA_HOME="/Users/shane/graalvm-ce-java17-22.3.1/Contents/Home"
}

java21() {
sdk use java 21.0.2-amzn
}

touchweb() {
touch index.html style.css app.js
}

npmi() {
npm i
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/shane/.bun/_bun" ] && source "/Users/shane/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
