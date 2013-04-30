# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras history-substring-search last-working-dir dircycle)

export LC_ALL=en_US.utf8
export LANG=en_US.utf8
eval `dircolors`

export EDITOR="emacsclient -c -a ''"
alias homesick="$HOME/.homeshick"

case $HOST in
    hbar)
        plugins+=(archlinux systemd)
        alias y="yaourt"
	;;
    ps139143)
	plugins+=(debian)
    	;;
    normandy)
	plugins+=(debian)
        export GIT_AUTHOR_EMAIL="neiser@kph.uni-mainz.de"
	export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
	alias root="root -l"
    	;;
    lxhadeb07)
        export GIT_AUTHOR_EMAIL="neiser@kph.uni-mainz.de"
	export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
	export EDITOR=nano
	PATH=$HOME/bin:$PATH
    	;;
    a2trb)
	plugins+=(debian)
        export GIT_AUTHOR_EMAIL="neiser@kph.uni-mainz.de"
	export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
	export EDITOR=nano
    	;;
    tantive)
	plugins+=(debian)
        export GIT_AUTHOR_EMAIL="neiser@kph.uni-mainz.de"
	export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
	;;
    *)
	echo "Host not recognized in .zshrc"
esac

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# colors in manpages with less

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
