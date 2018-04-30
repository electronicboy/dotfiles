#the following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/shane/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep nomatch
#bindkey -v
# End of lines configured by zsh-newuser-install
export PATH="$PATH:$HOME/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/go/bin:/snap/bin"

# just bundle antigen with the .dotfiles, saves our asses anyways...
[ -f ~/bin/antigen.zsh ] && source ~/bin/antigen.zsh

# apparently this isn't set when on SSH...
# (breaks ssh and the omzsh git integration)
export LC_ALL=en_US.UTF-8

#PAPER
export PAPER_TEST_MEMORY=2G

export PAPER_TEST_BASE_JVM_ARGS="-server -Xmx${PAPER_TEST_MEMORY:-2G} -Xms${PAPER_TEST_MEMORY:-2G} \
-Dfile.encoding=UTF-8 -XX:MaxGCPauseMillis=50 -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions \
-XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=70 \
-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5100"

#macOS specific...
if [ -f /Applications/YourKit-Java-Profiler-2017.02.app/Contents/Resources/bin/mac/libyjpagent.jnilib ]
then
	export PAPER_TEST_BASE_JVM_ARGS="-agentpath:/Applications/YourKit-Java-Profiler-2017.02.app/Contents/Resources/bin/mac/libyjpagent.jnilib "$PAPER_TEST_BASE_JVM_ARGS
fi

# I install this on the same place on every machine...
alias paper='. $HOME/work/Paper/Paper/paper'
# paper test server, because apparently IJ likes to index the full directory tree...
export PAPER_TEST_DIR='/Users/shane/work/Paper/TestServer'
# Update this at some point...
[ -d /Library/Java/JavaVirtualMachines/jdk1.8.0_141.jdk ] && export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_141.jdk/Contents/Home"

BULLETTRAIN_PROMPT_ORDER=(
time
context
dir
git
)

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen apply

export EDITOR="vim"
alias acraft='. /Users/shane/work/Paper/AlphheimCraft/acraft'
