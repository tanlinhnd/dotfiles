# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Set name of the theme to load.

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="risto"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="agnoster"
#ZSH_THEME="philthy"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(git colorize github virtualenv pip python zsh-syntax-highlighting)

# User configuration
export PATH="$HOME/bin":$PATH

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
alias tf=terraform
alias tfi=terraforming
alias tfp="terraform plan"
alias tfa="terraform apply"
alias vi=/usr/bin/vim
alias vim=nvim
#alias oldvim=/usr/bin/vim
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
alias ss="source $HOME/.zshrc"

# convenience aliases for editing configs
alias ev='vim ~/.config/nvim/init.vim'
alias evb='vim ~/.config/nvim/vim.bundles'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'

# alias for tmux
alias ta='tmux attach -t'
alias tnew='tmux new-session -s'
alias tls='tmux list-sessions'
alias tkill='tmux kill-session -t'

# Golang
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/bin

# Vietnamese
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/linhnguyen/anaconda2/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/linhnguyen/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/home/linhnguyen/anaconda2/etc/profile.d/conda.sh"
    else
        export PATH="/home/linhnguyen/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

