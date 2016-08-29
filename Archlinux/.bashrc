# author h4k1m
# executed on each interactive shell

# aliases
alias ll='ls -alh'
alias ..='cd ..'

# environment variables
export PS1="\[\e[1;92m\]\u@\h\[\e[0m\] \[\e[1;31m\]\w $ \[\e[0m\]"
export PATH=$PATH:/home/hakim/bin
export EDITOR=/usr/local/bin/vim

# fortunes
fortune | cowsay
