# author h4k1m
# executed on each interactive shell
cd ~/github/bookquotes

# aliases
alias ll='ls -alh'
alias ..='cd ..'

# environment variables
export PS1="\[\e[1;92m\]\u@\h\[\e[0m\] \[\e[1;31m\]\w $ \[\e[0m\]"
export PATH=$PATH:/home/hakim/bin:/home/hakim/.gem/ruby/2.4.0/bin:/home/hakim/.node_modules/bin:
export EDITOR=/usr/bin/vim

# fortunes
fortune | cowsay
