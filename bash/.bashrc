#
# ~/.bashrc
#

export TERMINAL=kitty
export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# diff.py alias for bfbbdecomp
alias diffpy='./diff.py -mwort'
alias diffnor='./diff.py -mwot'

#alias for xbone pairing
alias pairx="sudo systemctl kill -s SIGUSR1 xow"

#aliases for exa
alias ls=exa
alias ll='exa -l'
alias lll='exa -la'

#aliases for git
alias gs='git status'
alias gl='git log'

#rust
alias clippy='cargo clippy'

# use for diffing two hex files
melddump() {
	meld <(hexdump -C $1) <(hexdump -C $2)
}

source "$HOME/.cargo/env"

#temp
alias rm='echo use "trash" or /bin/rm instead.'

