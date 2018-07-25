# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Set name of the theme to load.

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="robbyrussell"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="vim"
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Custom ZSH
alias vi=nvim
alias vim=nvim
alias oldvim=/usr/local/bin/vim
alias kat="pygmentize -O encoding=UTF-8 -g"
alias kafon="/usr/local/Cellar/kafka/0.11.0.0/bin/kafka-server-start /usr/local/etc/kafka/server.properties >> /dev/null &"
alias kafoff="/usr/local/Cellar/kafka/0.11.0.0/bin/kafka-server-stop"
alias wo="workon"
# Copy my public key to the pasteboard
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Hide/show all desktop icons
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias pyserver="python -m SimpleTornadoServer"
alias ftpon="sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist"
alias ftpoff="sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist"
alias ss="source $ZSH/oh-my-zsh.sh"

# convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias evb='vim ~/.vimrc.bundles'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
export PATH="/usr/local/opt/opencv3/bin:$PATH"

# alias for tmux
alias ta='tmux attach -t'
alias tnew='tmux new-session -s'
alias tls='tmux list-sessions'
alias tkill='tmux kill-session -t'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Golang
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# pyenv
export PATH="/Users/tanlinh/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export ETCDCTL_API=3
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# added by travis gem
[ -f /Users/tanlinh/.travis/travis.sh ] && source /Users/tanlinh/.travis/travis.sh
