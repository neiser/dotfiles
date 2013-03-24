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
# DISABLE_AUTO_UPDATE="true"

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

case $HOST in
    hbar)
        plugins+=(archlinux systemd)
        alias y="yaourt"
	;;
    ps139143)
	plugins+=(debian)
    	;;
    *)
	echo "Host not recognized in .zshrc"
esac
source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR=emacs
alias homesick="$HOME/.homeshick"

#------------------------------
# History stuff
#------------------------------
#HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt histignorealldups
setopt histignorespace
setopt histreduceblanks
setopt histsavenodups
setopt sharehistory
setopt incappendhistory

# colors in manpages with less

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

eval `dircolors`

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate _force_rehash
zstyle ':completion:*:match:*' original only
# the longer the word, the more approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'


# remove trailing slashes
zstyle ':completion:*' squeeze-slashes true

# only regard things before cursor for completing
bindkey '^i' expand-or-complete-prefix


zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu yes=long-list
zstyle ':completion:*' menu select=2

# tab completion for PID :D
#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always

pids4kill() {
    local -a ps

    # This is using inside knowledge of the implementation.
    # Not guaranteed to work across upgrades, but likely to.
    if [[ $oldcontext = *:sudo:* ]]
    then
        # More inside knowledge:  Peek at the sudo options.
        # Also not guaranteed to work across upgrades.
        local u=$opt_args[-u]
        if [[ -n $u ]]
        then
            ps=(ps -u $u)
        else
            ps=(ps -u root)
        fi
    else
        ps=(ps -u $USER)
    fi
    $ps -o pid,%cpu,tty,cputime,cmd
}
zstyle ':completion:*:*:kill:*' command pids4kill


# ignore some things
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes


# cd not select parent dir.
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# helper function which rehashes automatically
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1	# Because we didn't really complete anything
}
