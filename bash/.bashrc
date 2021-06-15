#
# ~/.bashrc
#

export TERMINAL=kitty
export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=${PATH}:~/.local/bin

# Add bfbb linker
export WINEPATH=/home/admin/bfbb/decomp/tools/mwcc_compiler/2.0

# diff.py alias for bfbbdecomp
alias diffpy='./diff.py -mwort'
alias diffnor='./diff.py -mwot'

#use multithreading by default for make
alias make='make -j$(nproc)'

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

