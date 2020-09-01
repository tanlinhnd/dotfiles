# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Set name of the theme to load.

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="risto"
ZSH_THEME="pi"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize github jira vagrant virtualenv pip python)

# User configuration
export PATH=$HOME/bin:$PATH

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Custom ZSH
alias vi=vim
alias vim=nvim
# Copy my public key to the pasteboard
alias pubkey="cat ~/.ssh/id_rsa.pub | xclip -selection c | printf '=> Public key copied to pasteboard.\n'"
alias pyserver="python -m SimpleTornadoServer"
alias ss="source $HOME/.zshrc"

# convenience aliases for editing configs
alias ev='vim ~/.config/nvim/init.vim'
alias evb='vim ~/.config/nvim/vim.bundles'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
alias ei='vim ~/.i3/config'
alias eib='vim ~/.config/i3blocks/config'
alias es='vim ~/.ssh/config'

# alias for tmux
alias ta='tmux attach -t'
alias tnew='tmux new-session -s'
alias tls='tmux list-sessions'
alias tkill='tmux kill-session -t'

alias dell='xrandr --output HDMI1 --auto --right-of eDP1 --mode 2560x1440 && nitrogen --restore'
alias dell_dup='xrandr --output HDMI1 --auto --same-as eDP1 --mode 1920x1080 && nitrogen --restore'
alias hp='xrandr --output HDMI1 --auto --right-of eDP1 --mode 1920x1080 && nitrogen --restore'
alias office_dup='xrandr --output HDMI1 --auto --same-as eDP1 --mode 1920x1080 && nitrogen --restore'
alias office_right='xrandr --output HDMI1 --auto --right-of eDP1 --mode 1920x1080 && nitrogen --restore'

# alias for terraform
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Yarn
#export PATH="$PATH:`yarn global bin`"

# Anaconda2
export ANACONDA_HOME=$HOME/anaconda2
export PATH=$ANACONDA_HOME/bin:$PATH

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# disable beep
xset -b

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

